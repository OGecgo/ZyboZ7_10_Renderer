#pragma once
#include "mesh.h"
#include "color.h"
#include "vector.h"
#include "texture.h"
#include "camera.h"

#include "platform/display.h"
#include "platform/VTU.h"




//GRAPHICS
typedef struct {
    Vec4 pos;     // 16B
    Vec3 normal;  // 12B
    Vec3 tangent; // 12B
    float tanSign;// 4B
    Vec2 uv;      // 8B
    Vec3 worldPos;// 12B
} VSOut;          // 64B total


void ClearBuffers(const Framebuffer* fb, Color col);
void DrawMesh(const Framebuffer* fb, const Mesh* mesh, Vec3 pos, Vec3 rot, Vec3 scale, Camera* cam, Texture* diffuseTex, Texture* normalTex, Color col);


