/* Copyright (C) 2025, Evangelos Kolovos
 * This library is distributed under the MIT License.
 *
 * ---------- Texture -------------
 * Converts an uncompressed 24-bpp BMP into In-memory 2D texture
 * with optional mip chain and sampling helpers.
 */



#pragma once
#include "color.h"
#include "vector.h"

typedef struct Texture{
	int width, height;		// Texture size
	Color* pixels;			// BGRA8 pixel buffer, length = width*height

    struct Texture* mips;   // Array of (levels-1) Texture structs for levels 1..N-1,    NULL if none
    int  levels;			// Total number of mip levels.  If no mips: levels=1
} Texture;


/* Loads an uncompressed 24-bpp BMP, and creates a Texture with level 0 populated.
 * If buildMipChain=1, a full mip chain is generated using a 2x2 box filter.
 *
 * Parameters:
 *  filename        Path to the image file.
 *  buildMipChain   1-> build mip levels,    0-> keep only level 0.
 *
 * Returns 		    Newly allocated Texture* on success,   NULL on failure.
 */
Texture* TextureLoad(const char* filename, int buildMipChain);

// Free a Texture, its pixel buffer, and the entire mip chain.
void TextureFree(Texture* tex);
void Texture_BuildMipChain(Texture* base);
void Texture_FreeMipChain(Texture* base);



// Nearest-neighbor sample.
Vec3 Sample2D(const Texture* tex, float u, float v);

// Bilinear sample at mip level 0.
Vec3 Sample2DBilinear(const Texture* tex, float u, float v);

// Trilinear sample across mip levels.
Vec3 Sample2DTrilinear(const Texture* tex, float u, float v, float lod);


