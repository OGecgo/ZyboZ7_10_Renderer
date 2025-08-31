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


#include "camera.h"


// Computes the normalized camera forward vector from yaw/pitch.
// Positive pitch looks downward
static Vec3 camera_forward(const Camera* cam){
    return vec3_norm((Vec3){
        cosf(cam->pitch)*sinf(cam->yaw),
        -sinf(cam->pitch),
        cosf(cam->pitch)*cosf(cam->yaw)
    });
}

// Computes the normalized camera right vector.
static Vec3 camera_right(const Camera* cam){
    Vec3 worldUp = {0,1,0};
    return vec3_norm(vec3_cross(worldUp, camera_forward(cam)));
}

// Computes the camera up vector as forward × right.
static Vec3 camera_up(const Camera* cam){
    return vec3_cross(camera_forward(cam), camera_right(cam));
}



// PUBLIC API

Camera camera_create(Vec3 pos, float yaw, float pitch, float fov, float aspect, float zNear, float zFar){
    Camera cam = {0};
    cam.pos    = pos;
    cam.yaw    = yaw;
    cam.pitch  = pitch;
    cam.fov    = fov;
    cam.aspect = aspect;
    cam.zNear  = zNear;
    cam.zFar   = zFar;

    camera_update(&cam);
    return cam;
}

void camera_move(Camera* cam, CameraMovement dir, float dist){
    Vec3 f = camera_forward(cam);
    Vec3 r = camera_right(cam);
    Vec3 u = camera_up(cam);

    switch(dir) {
        case CAM_FORWARD:  cam->pos = vec3_add(cam->pos, vec3_scale(f,  dist)); break;
        case CAM_BACKWARD: cam->pos = vec3_add(cam->pos, vec3_scale(f, -dist)); break;
        case CAM_LEFT:     cam->pos = vec3_add(cam->pos, vec3_scale(r, -dist)); break;
        case CAM_RIGHT:    cam->pos = vec3_add(cam->pos, vec3_scale(r,  dist)); break;
        case CAM_UP:       cam->pos = vec3_add(cam->pos, vec3_scale(u,  dist)); break;
        case CAM_DOWN:     cam->pos = vec3_add(cam->pos, vec3_scale(u, -dist)); break;
    }
    camera_update(cam);
}

void camera_rotate(Camera* cam, float dYaw, float dPitch){
    cam->yaw   += dYaw;
    cam->pitch += dPitch;

    const float lim = deg2radf(89.0f);      //Clamp pitch to avoid gimbal flip
    if (cam->pitch >  lim) cam->pitch = lim;
    if (cam->pitch < -lim) cam->pitch = -lim;

    camera_update(cam);
}

void camera_update(Camera* cam) {
    cam->viewMatrix = mat4_viewMatrix(cam->pos, cam->pitch, cam->yaw);
    cam->projMatrix = mat4_perspective(cam->fov, cam->aspect, cam->zNear, cam->zFar);
}
