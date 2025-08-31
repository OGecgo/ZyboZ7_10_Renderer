#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include "mesh.h"
#include "renderer.h"
#include "texture.h"

#include "platform/display.h"
#include "platform/profiler.h"

#include "xtime_l.h"  // XTime_GetTime, COUNTS_PER_SECOND
#include "ff.h"       // FatFs main header





//----------------APP-----------------
Camera cam;
Mesh *cubeMesh, *planeMesh, *knightMesh;
Texture *brickTex, *brickNormTex, *terrainTex, *terrainNormTex, *knightTex, *knightNormTex;
Vec3 pos = { 0,0,10 };
Vec3 rot = { -90,0,0 };


void Game_Init(const Display* display){
	int W, H;
	Display_GetResolution(display, &W, &H);
    cam = camera_create( (Vec3){0,0,0}, 0, 0, deg2radf(60), (float)W/H, 0.1f, 100);

    //Load Meshes
    cubeMesh = LoadMesh("0:/Cube1.msh");
    knightMesh = LoadMesh("0:/KnightL1.msh");

    //Load Textures
    brickTex      = TextureLoad("0:/BrickD5.bmp", 1);
    brickNormTex  = TextureLoad("0:/BrickN5.bmp", 1);
    knightTex     = TextureLoad("0:/KnightD.bmp", 1);
    knightNormTex = TextureLoad("0:/KnightN.bmp", 1);

    PrintMesh(knightMesh, 0);
}

void Game_Update(float dt){
    //const float moveSpeed =10;
    const float rotSpeed = 45;

	//rot.x -= rotSpeed * dt;
}

void Game_Render(Framebuffer* frameBuf){
    ClearBuffers(frameBuf, color_rgb(30,30,30));

    DrawMesh(frameBuf, knightMesh, pos, rot, vec3(1 ,1 ,1), &cam, knightTex, knightNormTex, color_rgb(150, 0, 0));
    //DrawMesh(frameBuf, cubeMesh, pos, rot, vec3(1 ,1 ,1), &cam, brickTex, brickNormTex, color_rgb(150, 0, 0));
}

void Game_Shutdown(){
    FreeMesh(cubeMesh);
    FreeMesh(planeMesh);
}









///////////////////////////////////////////////////////////////////////////////////////////
//MAIN
int main(){
    printf("App started\n\r");


    // Mount SD card
    FATFS fs;
    FRESULT fres = f_mount(&fs, "0:", 1);
    if (fres != FR_OK) {
        printf("SD card mount failed (%d)\n", fres);
        return -1;
    }
    printf("SD card mount successful\n");


	//Initialize HDMI Drivers
    Display* display = Display_Create(640, 480);	//Dual-buffer, fixed res






    //MAIN LOOP
    _PROF_BEGIN("Main");
    const double cps = (double)COUNTS_PER_SECOND;
    XTime tPrev, tNow;
    XTime_GetTime(&tPrev);
    uint64_t frameNo = 0;


    Game_Init(display);
    while(1){  //platform.running) {
    	XTime_GetTime(&tNow);
    	double dt = (double)(tNow - tPrev) / cps;
    	tPrev = tNow;

    	if((frameNo&63) == 0)
    		printf("Delta Time: %f   FPS: %d\n", dt, (int)(1/dt));

    	if(frameNo==300)
    		break;

        Game_Update(dt);

        _PROF_BEGIN("Display_AcquireFrame");
        Framebuffer frameBuf = Display_AcquireFrame(display);
        _PROF_END("Display_AcquireFrame");

        _PROF_BEGIN("Game_Render");
        Game_Render(&frameBuf);
        _PROF_END("Game_Render");

        _PROF_BEGIN("Display_Present");
        Display_Present(display, &frameBuf);
        _PROF_END("Display_Present");

        frameNo+=1;
    }
    _PROF_END("Main");
    ProfShowStats_UART();
    Game_Shutdown();
    Display_Destroy(display);
    printf("Successfully ran application");
    return 0;
}

