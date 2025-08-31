/* Copyright (C) 2025, Evangelos Kolovos
 * This library is distributed under the MIT License.
 *
 * ---------- Mesh Loader -------------
 * In-memory triangular mesh representation. Works with
 * .msh files created with MeshImporter.
 */



#pragma once
#include <stddef.h>
#include <stdbool.h>
#include <stdint.h>
#include "vector.h"
#include "fixed32.h"

typedef struct {
    Vec3* Pos;
    Vec3* Normal;
    Vec4* Tangent;  // xyz = tangent, w = sign
    Vec2* UV;
    uint32_t* Indices;   // 3 * triangleCount

    // Repackaged vertex buffers to be used with VTU - (Vertex Transform Unit)
    fixed32*  VTU_posBuffer;
    fixed32*  VTU_nrmBuffer;
    fixed32*  VTU_tanBuffer;


    size_t vertexCount;
    size_t indexCount;
} Mesh;




/* Loads Mesh form an .msh file.
 *
 * The on-disk format is defined by the loader implementation (mesh.c) and includes
 * a compact header plus tightly packed attribute streams in a fixed order.
 */
Mesh* LoadMesh(const char* filepath);
void FreeMesh(Mesh* mesh);



#ifndef NDEBUG
void PrintMesh(Mesh* mesh, int verbose);
#endif

