/* Copyright (C) 2025, Evangelos Kolovos
 * Licensed under the MIT License.
 *
 * ------------- Mesh Importer ------------
 * This header defines the in-memory and on-disk representations of
 * triangle meshes used by the mesh importer. It provides:
 *
 *   - Mesh:        a runtime structure with pointers to vertex streams
 *                  (positions, normals, tangents, UVs) and optional indices.
 *
 *   - MeshHeader:  a compact binary header describing the serialized
 *                  mesh format (.msh), including version, vertex/index
 *                  counts, and which attributes are present.
 *
 *   - MeshFormatFlags: bitmask flags marking which vertex attributes
 *                  exist in the file payload.
 *
 * Together these enable importing Wavefront OBJ files and exporting
 * them into a lightweight binary format optimized for loading on
 * embedded systems (e.g., Zynq + FatFs).
 *
 * STEPS:   Obj file parsing -> Triangulation -> Tangent Generation -> VBuffer Optimization
 *
 * NOTE:    Uses MeshOptimizer (https://github.com/zeux/meshoptimizer)
 */


#include "mesh_importer.h"
#include "arrayList.h"
#include "MeshOptimizer/meshoptimizer.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <stdint.h>


#define USE_FATFS 1   // 0 -> stdio
#if USE_FATFS
  #include "ff.h"
#endif

// Convert OBJ index (which may be negative or 1-based) to 0-based absolute index
static int objAbsIndex(int idx, int listCount) {
    if (idx > 0)      return idx - 1;          // positive 1-based
    else if (idx < 0) return listCount + idx;  // negative relative
    else              return -1;               // 0 error
}


// Parse one "v/vt/vn" face token into separate indices (v, vt, vn).
// Returns 1 on success, 0 on failure.
static int parseIndexTriplet(const char *token, int *v, int *vt, int *vn){
    *v = *vt = *vn = 0;  // defaults are 0

    if (sscanf(token, "%d/%d/%d", v, vt, vn) == 3) return 1;
    if (sscanf(token, "%d/%d",    v, vt    ) == 2){ *vn = 0; return 1; }
    if (sscanf(token, "%d//%d",   v,    vn ) == 2){ *vt = 0; return 1; }
    if (sscanf(token, "%d",       v        ) == 1){ *vt = *vn = 0; return 1; }
    return 0;
}



// Generate per-vertex tangents for a non-indexed triangle list mesh.
// Uses simple Gram–Schmidt orthogonalization (not MikkTSpace).
static void calculateTangentsNonIndexed(Mesh *mesh){
    if(mesh->UV == NULL || mesh->Normal == NULL){
        printf("Warning: mesh has no UVs or Normals, skipping tangent generation. \n");
        return;
    }
    mesh->Tangent = (Vec4*) malloc( sizeof(Vec4) * mesh->vertexCount );
    if(mesh->Tangent==NULL){
        printf("ERROR: Out of memory while allocating mesh tangents\n");
        return;
    }

    for(size_t i=0; i<mesh->vertexCount; i+=3){
        Vec3 v0  = mesh->Pos[i]; Vec3 v1  = mesh->Pos[i+1]; Vec3 v2  = mesh->Pos[i+2];
        Vec2 uv0 = mesh->UV [i]; Vec2 uv1 = mesh->UV [i+1]; Vec2 uv2 = mesh->UV [i+2];

        Vec3 edge1 = vec3_sub(v1,v0);
        Vec3 edge2 = vec3_sub(v2,v0);
        Vec2 dUV1  = vec2_sub(uv1,uv0);
        Vec2 dUV2  = vec2_sub(uv2,uv0);

        float det = dUV1.x*dUV2.y - dUV1.y*dUV2.x;
        if(fabsf(det) < 1e-8f) det = 1.0f;   //Safety for UV problems
        float r = 1.0f / det;

        Vec3 tangent = (Vec3){
            r * ( dUV2.y*edge1.x - dUV1.y*edge2.x ),
            r * ( dUV2.y*edge1.y - dUV1.y*edge2.y ),
            r * ( dUV2.y*edge1.z - dUV1.y*edge2.z ) };

        Vec3 bitangent = (Vec3){
            r * (-dUV2.x*edge1.x + dUV1.x*edge2.x ),
            r * (-dUV2.x*edge1.y + dUV1.x*edge2.y ),
            r * (-dUV2.x*edge1.z + dUV1.x*edge2.z ) };


        // Write per vertex and apply orthonormalisation   (Gram-Schmidt method)
        for(int k=0; k<3; k++){
            int idx = i+k;

            Vec3 n = mesh->Normal[idx];
            Vec3 t = vec3_sub(tangent, vec3_scale(n, vec3_dot(n,tangent)) );
            t = vec3_norm(t);
            float sign = (vec3_dot(vec3_cross(n,t), bitangent) < 0.0f) ? -1.0f : 1.0f;      //sign helps calculating the binormals at runtime
            mesh->Tangent[idx] = (Vec4){t.x, t.y, t.z, sign};
        }
    }
}


// Generate per-vertex tangents for an indexed triangle mesh.
// Accumulates tangents/bitangents per index, then orthogonalizes.
static void calculateTangentsIndexed(Mesh* mesh){
    if (!mesh->UV || !mesh->Normal || !mesh->Indices) {
        printf("Warning: need UV+Normal+Indices for indexed tangents.\n");
        return;
    }
    const int vCount = (int)mesh->vertexCount;
    const int iCount = (int)mesh->indexCount;

    mesh->Tangent = (Vec4*) malloc(sizeof(Vec4) * vCount);
    if(mesh->Tangent==NULL){
        printf("ERROR: Out of memory while allocating mesh tangents\n");
        return;
    }


    Vec3* tan = (Vec3*) calloc(vCount, sizeof(Vec3));
    Vec3* bit = (Vec3*) calloc(vCount, sizeof(Vec3));
    if(!tan || !bit) {
        printf("ERROR: Out of memory while allocating mesh tmp tangents. \n");
        free(tan); free(bit);
        free(mesh->Tangent); mesh->Tangent = NULL;
        return;
    }

    for(int i=0; i<iCount; i+=3) {
        int i0 = (int)mesh->Indices[i];
        int i1 = (int)mesh->Indices[i+1];
        int i2 = (int)mesh->Indices[i+2];

        Vec3 p0 = mesh->Pos[i0], p1 = mesh->Pos[i1], p2 = mesh->Pos[i2];
        Vec2 w0 = mesh->UV[i0],  w1 = mesh->UV[i1],  w2 = mesh->UV[i2];

        Vec3 edge1 = vec3_sub(p1, p0);
        Vec3 edge2 = vec3_sub(p2, p0);
        Vec2 dUV1  = vec2_sub(w1, w0);
        Vec2 dUV2  = vec2_sub(w2, w0);

        float det = dUV1.x*dUV2.y - dUV1.y*dUV2.x;
        if (fabsf(det) < 1e-8f) det = 1.0f;		//Safety for UV issues
        float r = 1.0f / det;

        Vec3 T = (Vec3){
            r * ( dUV2.y*edge1.x - dUV1.y*edge2.x ),
            r * ( dUV2.y*edge1.y - dUV1.y*edge2.y ),
            r * ( dUV2.y*edge1.z - dUV1.y*edge2.z ) };
        Vec3 B = (Vec3){
            r * (-dUV2.x*edge1.x + dUV1.x*edge2.x ),
            r * (-dUV2.x*edge1.y + dUV1.x*edge2.y ),
            r * (-dUV2.x*edge1.z + dUV1.x*edge2.z ) };

        //Accumulate tangents and bitangents
        tan[i0] = vec3_add(tan[i0], T);
        tan[i1] = vec3_add(tan[i1], T);
        tan[i2] = vec3_add(tan[i2], T);
        bit[i0] = vec3_add(bit[i0], B);
        bit[i1] = vec3_add(bit[i1], B);
        bit[i2] = vec3_add(bit[i2], B);
    }

    for (int i = 0; i < vCount; ++i) {
        Vec3 n = mesh->Normal[i];
        Vec3 t = tan[i];
        // Gram–Schmidt: make t orthogonal to n
        t = vec3_sub(t, vec3_scale(n, vec3_dot(n, t)));
        t = vec3_norm(t);
        float sign = (vec3_dot(vec3_cross(n, t), bit[i]) < 0.0f) ? -1.0f : 1.0f;
        mesh->Tangent[i] = (Vec4){ t.x, t.y, t.z, sign };
    }
    free(tan);
    free(bit);
}


static void freeMesh(Mesh* mesh) {
    if(mesh == NULL)
        return;

    if(mesh->Pos != NULL)      free(mesh->Pos);
    if(mesh->Normal != NULL)   free(mesh->Normal);
    if(mesh->Tangent != NULL)  free(mesh->Tangent);
    if(mesh->UV != NULL)       free(mesh->UV);
    if(mesh->Indices != NULL)  free(mesh->Indices);

    free(mesh);
    mesh = NULL;
}



typedef struct {
    Vec3 pos;
    Vec3 nrm;
    Vec2 uv;
} VertexFull;


// Parses a Wavefront OBJ file into a Mesh struct
// indexedMesh : 1 to generate indexes
// NOTE: Uses MeshOptimizer for optimization  (https://github.com/zeux/meshoptimizer)
static void parseObj(Mesh *mesh, const char *path, int indexedMesh){
#if USE_FATFS
    FRESULT fres;
    FIL f;
    fres = f_open(&f, path, FA_READ);
    if (fres != FR_OK) { printf("Error: cannot open '%s'\n", path); return; }
#else
    FILE *f = fopen(path,"r");
    if(!f){ printf("Error: cannot open '%s'\n", path); return; }
#endif

    // Temp buffers
    ArrayList *vList      = list_create(sizeof(Vec3),    1024);
    ArrayList *nList      = list_create(sizeof(Vec3),    1024);
    ArrayList *uvList     = list_create(sizeof(Vec2),    1024);
    ArrayList *vFaceList  = list_create(sizeof(IntVec3), 1024);
    ArrayList *vtFaceList = list_create(sizeof(IntVec3), 1024);
    ArrayList *vnFaceList = list_create(sizeof(IntVec3), 1024);

    if(vList==NULL || nList==NULL || uvList==NULL || vFaceList==NULL || vtFaceList==NULL || vnFaceList==NULL){
        printf("ERROR: Out of memory while parsing .obj file temp ArrayLists. \n");
        return;
    }


    char line[1024];
#if USE_FATFS
    while(f_gets(line, sizeof(line), &f)) {
#else
    while(fgets(line, sizeof(line), f)) {
#endif
    	char *l = line;
        while(*l==' ' || *l=='\t') ++l;                     // trim leading
        if (*l=='#' || *l=='\n' || *l=='\r') continue;      // skip comments/blank

        if (strncmp(l,"v ",2)==0){
            Vec3 v;
            if(sscanf(l+2,"%f %f %f",&v.x,&v.y,&v.z)==3) list_push_back(vList,&v);
        }
        else if (strncmp(l,"vt ",3)==0){
            Vec2 uv;
            if(sscanf(l+3,"%f %f",&uv.x,&uv.y)==2) list_push_back(uvList,&uv);
        }
        else if (strncmp(l,"vn ",3)==0){
            Vec3 n;
            if(sscanf(l+3,"%f %f %f",&n.x,&n.y,&n.z)==3) list_push_back(nList,&n);
        }
        else if (strncmp(l,"f ",2)==0){
            #define MAX_VERTS 128
            int vIdx[MAX_VERTS], vtIdx[MAX_VERTS], vnIdx[MAX_VERTS];

            int vertCount=0;
            char *token = strtok(l+2," \t\r\n");
            while(token && vertCount<MAX_VERTS){
                int v=0, vt=0, vn=0;
                if(!parseIndexTriplet(token,&v,&vt,&vn)){
                    printf("WARNING: Bad face token: %s\n", token);
                    break;
                }
                vIdx [vertCount] = v;
                vtIdx[vertCount] = vt;
                vnIdx[vertCount] = vn;
                vertCount++;
                token = strtok(NULL," \t\r\n");
            }
            if (vertCount < 3) continue;

            // Triangulate faces
            for (int i=1; i<vertCount-1; i++){
                int triIndex[3] = {0, i, i+1};

                int v0  = objAbsIndex( vIdx[triIndex[0]], (int)vList->count );
                int v1  = objAbsIndex( vIdx[triIndex[1]], (int)vList->count );
                int v2  = objAbsIndex( vIdx[triIndex[2]], (int)vList->count );

                int vt0 = objAbsIndex( vtIdx[triIndex[0]], (int)uvList->count );
                int vt1 = objAbsIndex( vtIdx[triIndex[1]], (int)uvList->count );
                int vt2 = objAbsIndex( vtIdx[triIndex[2]], (int)uvList->count );

                int vn0 = objAbsIndex( vnIdx[triIndex[0]], (int)nList->count );
                int vn1 = objAbsIndex( vnIdx[triIndex[1]], (int)nList->count );
                int vn2 = objAbsIndex( vnIdx[triIndex[2]], (int)nList->count );

                IntVec3 tmp;
                tmp = (IntVec3){ v0,  v1,  v2  }; list_push_back(vFaceList,  &tmp);
                tmp = (IntVec3){ vt0, vt1, vt2 }; list_push_back(vtFaceList, &tmp);
                tmp = (IntVec3){ vn0, vn1, vn2 }; list_push_back(vnFaceList, &tmp);
            }
        }
    }
#if USE_FATFS
    f_close(&f);
#else
    fclose(f);
#endif



    if (vList->count==0 || vFaceList->count==0)
    	printf("Error: OBJ contains no vertices or faces.\n");

    else{
		const int triCount    = vFaceList->count;
		const int cornerCount = triCount * 3;

		//Expand attributes for every corner of every triangle
		VertexFull *cornerVtx = (VertexFull*) malloc(sizeof(VertexFull)*cornerCount);
		if(cornerVtx==NULL){
		    printf("ERROR: Out of memory while expanding triangles.\n");
		    free(cornerVtx);
		    return;
		}

		IntVec3* vF   = (IntVec3*) vFaceList->data;
		IntVec3* vtF  = (IntVec3*) vtFaceList->data;
		IntVec3* vnF  = (IntVec3*) vnFaceList->data;

		for(int t=0;t<triCount;++t){
			for(int i=0;i<3;++i){
				int dst = t*3 + i;
				int vi = ((int*)&vF[t])[i];
				int ti = ((int*)&vtF[t])[i];
				int ni = ((int*)&vnF[t])[i];

				cornerVtx[dst].pos = 		  ((Vec3*)vList->data)[vi];
				cornerVtx[dst].nrm = (ni>=0)? ((Vec3*)nList->data)[ni]   : (Vec3){0,0,1};
				cornerVtx[dst].uv  = (ti>=0)? ((Vec2*)uvList->data)[ti]  : (Vec2){0,0};
			}
		}


		if(!indexedMesh) {
			// Allocate mesh
			mesh->vertexCount = cornerCount;
			mesh->indexCount  = 0;
			mesh->Indices     = NULL;

			mesh->Pos     = (Vec3*) malloc(sizeof(Vec3)*cornerCount);
			mesh->Normal  = (Vec3*) malloc(sizeof(Vec3)*cornerCount);
			mesh->UV      = (Vec2*) malloc(sizeof(Vec2)*cornerCount);
			mesh->Tangent = NULL;
			if(mesh->Pos==NULL || mesh->Normal==NULL || mesh->UV==NULL){
				printf("ERROR: Out of memory while allocating mesh buffers.\n");
				freeMesh(mesh);
			    return;
			}

			for(int i=0; i<cornerCount; i++){
				mesh->Pos[i]    = cornerVtx[i].pos;
				mesh->Normal[i] = cornerVtx[i].nrm;
				mesh->UV[i]     = cornerVtx[i].uv;
			}

			calculateTangentsNonIndexed(mesh);
		}
		else{ // --- INDEXED MESH ---

			// Build remap table from the expanded corners
			unsigned int* remap = (unsigned int*) malloc(sizeof(unsigned int) * cornerCount);
			if(remap==NULL){
				printf("ERROR: Out of memory while allocating remap array.\n");   free(remap);   return;
			}
			size_t uniqueCount = meshopt_generateVertexRemap( remap, NULL, cornerCount, cornerVtx, cornerCount, sizeof(VertexFull));


			// Build unique vertex buffers & new index buffer
			VertexFull*   optVerts   = (VertexFull*) malloc( sizeof(VertexFull) * uniqueCount);
			unsigned int* optIndices = (unsigned int*) malloc( sizeof(unsigned int) * cornerCount);
			if(optVerts==NULL || optIndices==NULL){
				printf("ERROR: Out of memory while allocating temp optimization buffers.\n");   free(optVerts);  free(optIndices);   return;
			}
			meshopt_remapIndexBuffer( optIndices, NULL, cornerCount, remap);
			meshopt_remapVertexBuffer( optVerts, cornerVtx, cornerCount, sizeof(VertexFull), remap);

			// optional: post-processing
			meshopt_optimizeVertexCache(optIndices, optIndices, cornerCount, uniqueCount);
			//meshopt_optimizeOverdraw(mesh->Indices, mesh->Indices, cornerCount, mesh->Pos, uniqueCount, sizeof(Vec3), 1.05f);
			meshopt_optimizeVertexFetch(optVerts, optIndices, cornerCount, optVerts, uniqueCount, sizeof(VertexFull));




			// Allocate mesh
			mesh->vertexCount = uniqueCount;
			mesh->indexCount  = cornerCount;
			mesh->Pos     = (Vec3*) malloc(sizeof(Vec3)*uniqueCount);
			mesh->Normal  = (Vec3*) malloc(sizeof(Vec3)*uniqueCount);
			mesh->UV      = (Vec2*) malloc(sizeof(Vec2)*uniqueCount);
			mesh->Tangent = NULL;
			mesh->Indices = (uint32_t*) malloc(sizeof(uint32_t)*cornerCount);

			if(mesh->Pos==NULL || mesh->Normal==NULL || mesh->UV==NULL || mesh->Indices==NULL){
				printf("ERROR: Out of memory while allocating mesh buffers.\n");
				freeMesh(mesh);
			    return;
			}

			for(size_t i=0; i<uniqueCount; i++){
				mesh->Pos[i]    = optVerts[i].pos;
				mesh->Normal[i] = optVerts[i].nrm;
				mesh->UV[i]     = optVerts[i].uv;
			}
			for(int i=0; i<cornerCount; i++)
				mesh->Indices[i]= optIndices[i];

			calculateTangentsIndexed(mesh);


			free(remap); free(optVerts); free(optIndices);
		}

		free(cornerVtx);
    }


    list_destroy(vList);     list_destroy(nList);      list_destroy(uvList);
    list_destroy(vFaceList); list_destroy(vtFaceList); list_destroy(vnFaceList);
}








// Write a block of data to file (FatFs or stdio).
// Returns 1 on success, 0 on error.
#if USE_FATFS
    static int write_all( FIL* f, const void* buf, size_t sz){
#else
    static int write_all( FILE* f, const void* buf, size_t sz){
#endif


#if USE_FATFS
    const uint8_t* p = (const uint8_t*)buf;
    while (sz) {
        UINT w = 0;
        FRESULT r = f_write(f, p, (UINT)(sz > 0xFFFFFFFFu ? 0xFFFFFFFFu : sz), &w);
        if (r != FR_OK || w == 0) return 0;
        p  += w;
        sz -= w;
    }

    return 1;
#else
    return fwrite(buf, 1, sz, f) == sz;
#endif
}



// Serialize a Mesh into the internal binary .msh format
// Returns 1 on success, 0 on error.
int SerializeMesh(const char* path, const Mesh* m){
    if (!m || !m->Pos || m->vertexCount==0) return 0;
    if (m->indexCount!=0 && m->indexCount%3u!=0) return 0;

    MeshHeader header;
    memset(&header, 0, sizeof(header));
    header.version = MESH_HEADER_VERSION;
    header.flags   = (m->Normal  ? MESH_HAS_NORMAL  : 0)
                   | (m->UV      ? MESH_HAS_UV      : 0)
                   | (m->Tangent ? MESH_HAS_TANGENT : 0)
				   | (m->Indices ? MESH_HAS_INDICES : 0);
    header.vertexCount  = (uint32_t)m->vertexCount;
    header.indexCount   = (uint32_t)m->indexCount;
    header.dataOffset   = (uint32_t)sizeof(MeshHeader);

#if USE_FATFS
    FIL f;
    if (f_open(&f, path, FA_WRITE | FA_CREATE_ALWAYS) != FR_OK)return 0;

    int ok 			  =  1 && write_all(&f, &header,    sizeof(header));
    ok 				  = ok && write_all(&f, m->Pos,     sizeof(Vec3)*m->vertexCount);
    if(m->Normal)  ok = ok && write_all(&f, m->Normal,  sizeof(Vec3)*m->vertexCount);
    if(m->UV)      ok = ok && write_all(&f, m->UV,      sizeof(Vec2)*m->vertexCount);
    if(m->Tangent) ok = ok && write_all(&f, m->Tangent, sizeof(Vec4)*m->vertexCount);
    ok 				  = ok && write_all(&f, m->Indices, sizeof(uint32_t)*m->indexCount);

    f_close(&f);
    return ok;
#else
    FILE* f = fopen(path, "wb");
    if (!f) return 0;
    int ok 			  =  1 && write_all(f, &header,    sizeof(header));
    ok 	   			  = ok && write_all(f, m->Pos, 	   sizeof(Vec3) * m->vertexCount);
    if(m->Normal)  ok = ok && write_all(f, m->Normal,  sizeof(Vec3)*m->vertexCount);
    if(m->UV)      ok = ok && write_all(f, m->UV,      sizeof(Vec2)*m->vertexCount);
    if(m->Tangent) ok = ok && write_all(f, m->Tangent, sizeof(Vec4)*m->vertexCount);
    ok 			      = ok && write_all(f, m->Indices, sizeof(uint32_t) * m->indexCount);

    fclose(f);
    return ok;
#endif
}







// Public API:
int Obj2Mesh(const char* objPath, const char* outMeshPath, int indexedMesh){
    Mesh* mesh = (Mesh*)malloc(sizeof(Mesh));
    if(mesh == NULL)
        return 0;

    mesh->Pos     = NULL;
    mesh->Normal  = NULL;
    mesh->Tangent = NULL;
    mesh->UV      = NULL;
    mesh->Indices = NULL;
    mesh->vertexCount = 0;
    mesh->indexCount = 0;


    parseObj(mesh, objPath, indexedMesh);
    if(!mesh->Pos || mesh->vertexCount == 0) {
        xil_printf("Error while parsing obj, vertices not found! \n");
    	freeMesh(mesh);
        return 0;
    }

    // Write to binary mesh file
    int res = SerializeMesh(outMeshPath, mesh);
    if(res==0) {
    	xil_printf("Error while saving mesh format! \n");
    	freeMesh(mesh);
        return 0;
    }

    freeMesh(mesh);
    return 1;
}


