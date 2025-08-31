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




#pragma once
#include <stddef.h>
#include <stdbool.h>
#include <stdint.h>
#include "vector.h"


// In-memory Mesh representation, containing vertex/index buffers
typedef struct {
    Vec3* Pos;
    Vec3* Normal;
    Vec4* Tangent;  	 // xyz = tangent, w = sign
    Vec2* UV;
    uint32_t* Indices;   // Indices are 0-based into the vertex buffers

    size_t vertexCount;
    size_t indexCount;
} Mesh;





//------- On-disk binary format --------
//--------------------------------------

#define MESH_HEADER_VERSION 1u

// Bit flags describing which vertex streams are present in the file payload.
enum MeshFormatFlags {
    MESH_HAS_NORMAL  = 1u << 0,
    MESH_HAS_UV      = 1u << 1,
    MESH_HAS_TANGENT = 1u << 2,
	MESH_HAS_INDICES = 1u << 3,
};

typedef struct MeshHeader {
    uint16_t version;      // MESH_HEADER_VERSION
    uint16_t flags;        // see MeshFormatFlags
    uint32_t vertexCount;  // number of vertices
    uint32_t indexCount;   // number of 32 bit indices  (0 if non-indexed)
    uint32_t dataOffset;   // byte offset to payload
} MeshHeader;






/* Convert an .obj file to internal mesh format and saves it as a file.

  Parameters:
    objPath     : path to the input OBJ (e.g., "0:/Cube.obj")
    outMeshPath : path to output MSH (e.g., "0:/Cube.msh")
    indexedMesh : 1: generate indexed triangles     0: expand faces

  Returns:
    1 on success, 0 on failure
*/
int Obj2Mesh(const char* objPath, const char* outMeshPath, int indexedMesh);


