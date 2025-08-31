/* Copyright (C) 2025, Evangelos Kolovos
 * This library is distributed under the MIT License.
 *
 * ---------- Mesh Loader -------------
 * In-memory triangular mesh representation. Works with
 * .msh files created with MeshImporter.
 */



#include "mesh.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>


#define USE_FATFS 1   // 0 -> stdio
#if USE_FATFS
  #include "ff.h"
#endif


// ----- FILE WRAPPER -----
#if USE_FATFS
typedef struct { FIL f; size_t size; } File;

static int file_open(File* f, const char* path){
    if (f_open(&f->f, path, FA_READ) != FR_OK)
    	return 0;

    f->size = (size_t)f_size(&f->f);
    return 1;
}
static size_t file_size(File* f){
	return f->size;
}

static int file_seek(File* f, uint32_t off){
    return f_lseek(&f->f, off) == FR_OK;
}

static int file_read_all(File* f, void* buf, size_t sz){
    const UINT CHUNK = 32u * 1024u;
    uint8_t* p = (uint8_t*)buf;
    while (sz){
        UINT want = (UINT)(sz > CHUNK ? CHUNK : sz), got=0;
        FRESULT r = f_read(&f->f, p, want, &got);
        if (r != FR_OK || got == 0) return 0;
        p += got; sz -= got;
    }
    return 1;
}

static void file_close(File* f){
	f_close(&f->f);
}

#else
typedef struct { FILE* f; size_t size; } File;

static int file_open(File* fh, const char* path){
    fh->f = fopen(path, "rb");
    if (!fh->f) return 0;
    fseek(fh->f, 0, SEEK_END);
    fh->size = (size_t)ftell(fh->f);
    fseek(fh->f, 0, SEEK_SET);
    return 1;
}
static size_t file_size(File* fh){ return fh->size; }
static int file_seek(File* fh, uint32_t off){ return fseek(fh->f, (long)off, SEEK_SET) == 0; }
static int file_read_all(File* fh, void* buf, size_t sz){
    uint8_t* p = (uint8_t*)buf;
    while (sz){
        size_t got = fread(p, 1, sz, fh->f);
        if (got == 0) return 0;
        p += got; sz -= got;
    }
    return 1;
}
static void file_close(File* fh){ if (fh->f) fclose(fh->f); }
#endif





// MESH FILE HEADER FORMAT
#define MESH_HEADER_VERSION  1u
enum MeshFormatFlags {
    MESH_HAS_NORMAL  = 1u << 0,
    MESH_HAS_UV      = 1u << 1,
    MESH_HAS_TANGENT = 1u << 2,
    MESH_HAS_INDICES = 1u << 3,
};

typedef struct MeshHeader {
    uint16_t version;
    uint16_t flags;
    uint32_t vertexCount;
    uint32_t indexCount;
    uint32_t dataOffset;
} MeshHeader;



// utils
static void mesh_free(Mesh* mesh){
    if(mesh == NULL)
        return;

    if(mesh->Pos != NULL)      free(mesh->Pos);
    if(mesh->Normal != NULL)   free(mesh->Normal);
    if(mesh->Tangent != NULL)  free(mesh->Tangent);
    if(mesh->UV != NULL)       free(mesh->UV);
    if(mesh->Indices != NULL)  free(mesh->Indices);


    if(mesh->VTU_posBuffer != NULL)  free(mesh->VTU_posBuffer);
    if(mesh->VTU_nrmBuffer != NULL)  free(mesh->VTU_nrmBuffer);
    if(mesh->VTU_tanBuffer != NULL)  free(mesh->VTU_tanBuffer);

    free(mesh);
    mesh = NULL;
}

// Multiply with overflow check: returns 1 on success and writes a*b to out
static int safe_mul(size_t a, size_t b, size_t* out){
    if(!a || !b){ *out = 0; return 1; }
    if(a > SIZE_MAX / b) return 0;
    *out = a * b; return 1;
}

static int mesh_expected_size(const MeshHeader* h, size_t* out_total){
    size_t total = h->dataOffset, add;

    // Pos
    if (!safe_mul(h->vertexCount, sizeof(Vec3), &add)) return 0;
    if (total > SIZE_MAX - add) return 0;
    total += add;

    // Normal
    if (h->flags & MESH_HAS_NORMAL){
        if (!safe_mul(h->vertexCount, sizeof(Vec3), &add)) return 0;
        if (total > SIZE_MAX - add) return 0;
        total += add;
    }

    // UV
    if (h->flags & MESH_HAS_UV){
        if (!safe_mul(h->vertexCount, sizeof(Vec2), &add)) return 0;
        if (total > SIZE_MAX - add) return 0;
        total += add;
    }

    // Tangent
    if (h->flags & MESH_HAS_TANGENT){
        if (!safe_mul(h->vertexCount, sizeof(Vec4), &add)) return 0;
        if (total > SIZE_MAX - add) return 0;
        total += add;
    }

    // Indices
    if (h->indexCount > 0 || (h->flags & MESH_HAS_INDICES)){
        if (!safe_mul(h->indexCount, sizeof(uint32_t), &add)) return 0;
        if (total > SIZE_MAX - add) return 0;
        total += add;
    }

    *out_total = total;
    return 1;
}

static int read_stream(File* fh, void** dst, size_t bytes){
    if (bytes == 0){
    	*dst = NULL;
    	return 1;
    }

    void* p =  malloc(bytes);
    if (!p) return 0;
    if (!file_read_all(fh, p, bytes)){ free(p); return 0; }
    *dst = p; return 1;
}










//Public API
Mesh* LoadMesh(const char* filepath){
    File fh;
    Mesh* m = NULL;
    MeshHeader head = {0};

    if(!file_open(&fh, filepath)){
        printf("LoadMesh: open mesh file failed: %s\n", filepath);
        return NULL;
    }

    // Read header
    if (!file_read_all(&fh, &head, sizeof(head))){
        printf("LoadMesh: read header failed\n");
        goto fail;
    }
    if (head.version != MESH_HEADER_VERSION){
        printf("LoadMesh: mesh file version mismatch (got %u, want %u)\n", head.version, MESH_HEADER_VERSION);
        goto fail;
    }

    // header sanity tests
    size_t fsz = file_size(&fh);
    if (head.dataOffset < sizeof(MeshHeader) || head.dataOffset > fsz){
        printf("LoadMesh: bad dataOffset=%u (file %zu)\n", (unsigned int)head.dataOffset, fsz);
        goto fail;
    }
    size_t expect = 0;
    if (!mesh_expected_size(&head, &expect) || expect != fsz){
        printf("LoadMesh: size mismatch (expect %zu, file %zu)\n", expect, fsz);
        goto fail;
    }
    if (!file_seek(&fh, head.dataOffset)){
        printf("LoadMesh: seek to %u failed\n", (unsigned int)head.dataOffset);
        goto fail;
    }


    // Allocate mesh
    m = calloc(1, sizeof(Mesh));
    if(!m){ printf("LoadMesh: out of memory\n"); goto fail; }
    m->vertexCount = head.vertexCount;
    m->indexCount  = head.indexCount;

    // Read streams in order
    size_t bytes = 0;

    // Pos (required)
    if (!safe_mul(head.vertexCount, sizeof(Vec3), &bytes) || bytes == 0){
        printf("LoadMesh: invalid vertexCount\n"); goto fail;
    }
    if (!read_stream(&fh, (void**)&m->Pos, bytes)){ printf("LoadMesh: read Pos failed\n"); goto fail; }

    // Normal
    if (head.flags & MESH_HAS_NORMAL){
        if (!safe_mul(head.vertexCount, sizeof(Vec3), &bytes)){ printf("LoadMesh: overflow Normal\n"); goto fail; }
        if (!read_stream(&fh, (void**)&m->Normal, bytes)){ printf("LoadMesh: read Normal failed\n"); goto fail; }
    }

    // UV
    if (head.flags & MESH_HAS_UV){
        if (!safe_mul(head.vertexCount, sizeof(Vec2), &bytes)){ printf("LoadMesh: overflow UV\n"); goto fail; }
        if (!read_stream(&fh, (void**)&m->UV, bytes)){ printf("LoadMesh: read UV failed\n"); goto fail; }
    }

    // Tangent
    if (head.flags & MESH_HAS_TANGENT){
        if (!safe_mul(head.vertexCount, sizeof(Vec4), &bytes)){ printf("LoadMesh: overflow Tangent\n"); goto fail; }
        if (!read_stream(&fh, (void**)&m->Tangent, bytes)){ printf("LoadMesh: read Tangent failed\n"); goto fail; }
    }

    // Indices
    if (head.indexCount > 0 || (head.flags & MESH_HAS_INDICES)){
        if (!safe_mul(head.indexCount, sizeof(uint32_t), &bytes)){ printf("LoadMesh: overflow Indices\n"); goto fail; }
        if (bytes > 0 && !read_stream(&fh, (void**)&m->Indices, bytes)){
            printf("LoadMesh: read Indices failed\n"); goto fail;
        }
    }


    // BUILD VTU BUFFERS
    m->VTU_posBuffer = memalign(64, 16u * m->vertexCount);		//void* p = aligned_alloc(64, bytes);
    m->VTU_nrmBuffer = memalign(64, 16u * m->vertexCount);		//void* p = aligned_alloc(64, bytes);
    m->VTU_tanBuffer = memalign(64, 16u * m->vertexCount);		//void* p = aligned_alloc(64, bytes);

    for(size_t i = 0; i < m->vertexCount; i++) {
    	const Vec3 pos = m->Pos[i];
    	const Vec3 nrm = m->Normal[i];
    	const Vec4 tan = m->Tangent[i];

    	m->VTU_posBuffer[i*4   ] = float_to_fixed32(pos.x);
    	m->VTU_posBuffer[i*4 +1] = float_to_fixed32(pos.y);
    	m->VTU_posBuffer[i*4 +2] = float_to_fixed32(pos.z);
    	m->VTU_posBuffer[i*4 +3] = FP_ONE;

    	m->VTU_nrmBuffer[i*4   ] = float_to_fixed32(nrm.x);
    	m->VTU_nrmBuffer[i*4 +1] = float_to_fixed32(nrm.y);
       	m->VTU_nrmBuffer[i*4 +2] = float_to_fixed32(nrm.z);
       	m->VTU_nrmBuffer[i*4 +3] = 0;


      	m->VTU_tanBuffer[i*4   ] = float_to_fixed32(tan.x);
       	m->VTU_tanBuffer[i*4 +1] = float_to_fixed32(tan.y);
       	m->VTU_tanBuffer[i*4 +2] = float_to_fixed32(tan.z);
       	m->VTU_tanBuffer[i*4 +3] = 0;
    }


    file_close(&fh);
    return m;

fail:
    file_close(&fh);
    mesh_free(m);
    return NULL;
}


void FreeMesh(Mesh* mesh) {
	mesh_free(mesh);
}





#ifndef NDEBUG
void PrintMesh(Mesh* mesh, int verbose){
    if (!mesh) {
        printf("PrintMesh ERROR: NULL mesh pointer! \n");
        return;
    }
    if (mesh->vertexCount == 0 || !mesh->Pos) {
    	printf("PrintMesh ERROR: empty mesh \n");
        return;
    }

    printf("Mesh summary: %zu vertices\n", mesh->vertexCount);
    printf("Mesh summary: %zu indices\n", mesh->indexCount);

    if(verbose){
		for (size_t i=0; i<mesh->vertexCount; ++i) {
			printf("  [%6zu]  P=(% .6f, % .6f, % .6f)", i, mesh->Pos[i].x, mesh->Pos[i].y, mesh->Pos[i].z);

			if (mesh->Normal)
				printf("  N=(% .6f, % .6f, % .6f)", mesh->Normal[i].x, mesh->Normal[i].y, mesh->Normal[i].z);

			if (mesh->Tangent)
				printf("  Tan=(% .6f, % .6f, % .6f)", mesh->Tangent[i].x, mesh->Tangent[i].y, mesh->Tangent[i].z);

			if (mesh->UV)
				printf("  UV=(% .6f, % .6f)", mesh->UV[i].x, mesh->UV[i].y);

			printf("\n");
		}

		if(mesh->Indices && mesh->indexCount > 0){
			for(size_t i=0; i<mesh->indexCount; ++i)
                printf("  idx[%6zu] = %u\n", i, (unsigned)mesh->Indices[i]);
		}
    }
}
#endif

