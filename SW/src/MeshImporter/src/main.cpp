/* Copyright (C) 2025, Evangelos Kolovos
 * Licensed under the MIT License.
 *
 * Mesh Importer — main program (v1.0)
 *
 * This is a small utility for Zynq-7000 boards that loads
 * a Wavefront OBJ file from an SD card (via FatFs) and converts
 * it into a compact internal binary mesh format (.msh) using Obj2Mesh.
 *
 *
 * STEPS:   Obj file parsing -> Triangulation -> Tangent Generation -> VBuffer Optimization
 *
 * NOTE:    Uses MeshOptimizer (https://github.com/zeux/meshoptimizer)
 */


// !!! ------ TO USE: Change defines bellow ------- !!!
#define DRIVE          "0:"					// Drive Label (no need to modify)
#define OBJ_IN_PATH    DRIVE "/Cube.obj"	// path to .obj file to import
#define MESH_OUT_PATH  DRIVE "/Cube1.msh"	// path to exported .msh









#include "mesh_importer.h"
#include "ff.h"       // FatFs main header
#include "xil_printf.h"

int main(){
	xil_printf("Mesh Importer running. \n\r");

	// Mount SD card
	FATFS fs;
	FRESULT fres = f_mount(&fs, DRIVE, 1);
	if (fres != FR_OK) {
	    xil_printf("SD card mount failed (%d)\n", fres);
	    return -1;
	}
	xil_printf("SD card mount successful on %s\r\n", DRIVE);



	//Convert obj->mesh
	int res = Obj2Mesh(OBJ_IN_PATH, MESH_OUT_PATH, 1);
	if(res==0){
		xil_printf("ERROR: Obj2Mesh failed.\n");
		return -1;
	}



	f_mount(NULL, DRIVE, 0);
	xil_printf("Mesh Importer finished.\r\n");
	return 0;
}
