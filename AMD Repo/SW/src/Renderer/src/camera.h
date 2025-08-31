/* Copyright (C) 2025, Evangelos Kolovos
 * This library is distributed under the MIT License.
 *
 * ---------- Camera (yaw/pitch) -------------
 * A perspective camera with move and rotate functions.
 *
 * Coordinate system & conventions:
 *	- Right-handed: +X right, +Y up, +Z forward (when yaw=0, pitch=0).
 *	- Angles are in radians.
 *  - Positive pitch looks DOWN
 *
 * NOTE: If you modify camera variables directly, call camera_update()
 *       afterward to refresh viewMatrix and projMatrix.
 */




#pragma once
#include "vector.h"


typedef struct {
    Vec3  pos;    // world space position
    float yaw;    // Yaw (around +Y), in radians
    float pitch;  // Pitch (around +X), in radians  (positive looks down)

    float fov;    // field of view, in radians
    float aspect;
    float zNear, zFar;

    Mat4 viewMatrix;
    Mat4 projMatrix;
} Camera;



/* Create a camera and compute its initial view/projection matrices.
 *
 * Parameters:
 *  pos     World position.
 *  yaw     Yaw (radians, around +Y).
 *  pitch   Pitch (radians, around +X). Positive looks down.
 *  fov     Field of view in radians.
 *  aspect  Aspect ratio.
 *  zNear   Near clip.
 *  zFar    Far clip.
 *
 *  Returns Initialized Camera with matrices computed.
 */
Camera camera_create(Vec3 pos, float yaw, float pitch, float fov, float aspect, float zNear, float zFar);



typedef enum { CAM_FORWARD, CAM_BACKWARD, CAM_LEFT, CAM_RIGHT, CAM_UP, CAM_DOWN } CameraMovement;

/* Move the camera along its local basis.
 * Calls camera_update() internally.
 *
 * Parameters:
 *  cam   Camera to move.
 *  dir   Movement direction (camera-relative).
 *  dist  Distance in world units.
 */
void camera_move(Camera* cam, CameraMovement dir, float dist);



/* Rotates the camera by dYaw/dPitch and clamp pitch to avoid gimbal flip.
 * Calls camera_update() internally.
 *
 * Parameters:
 *  cam     Camera to rotate.
 *  dYaw    Delta yaw in radians.
 *  dPitch  Delta pitch in radians.
 */
void camera_rotate(Camera* cam, float dYaw, float dPitch);


/* Recomputes view/projection matrices from current parameters.
 * Call this after modifying camera directly.
 */
void camera_update(Camera* cam);

