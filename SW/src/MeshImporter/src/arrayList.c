/* Copyright (C) 2025, Evangelos Kolovos
 * This library is distributed under the MIT License.
 *
 * ------------ Minimal, POD-friendly dynamic array -----------
 * This container stores elements by value in a contiguous void* buffer.
 * It is suitable for trivially copyable types (POD / blit-safe data).
 */


#include "arrayList.h"
#include <stdlib.h>
#include <string.h>
#include <stdint.h>


// Growth policy helper.
// - 1.5x growth, minimum capacity 4.
// - Saturates at SIZE_MAX on overflow to avoid wrapping.
static size_t next_cap(size_t cur){
    if (cur == 0) return 4;
    size_t half = cur >> 1;
    if (cur > SIZE_MAX - half)
        return SIZE_MAX;
    return cur + half;
}



// ----------------- Public API ------------------

ArrayList* list_create(size_t elem_size, size_t initial_cap){
    if (elem_size == 0) return NULL;

    ArrayList* list = (ArrayList*)malloc(sizeof *list);
    if (!list) return NULL;

    list->data = NULL;
    list->elem_size = elem_size;
    list->count = 0;
    list->capacity = 0;

    // If an initial capacity is requested, reserve it now.
    if (initial_cap && !list_reserve(list, initial_cap)) {
        free(list);
        return NULL;
    }
    return list;
}

void list_destroy(ArrayList* list){
	if (!list) return;
	free(list->data);
	free(list);
}

bool list_reserve(ArrayList* list, size_t new_cap){
    if(!list) return false;
    if(new_cap <= list->capacity) return true;

    // Check for overflow before realloc
    if(new_cap > SIZE_MAX/list->elem_size) return false;

    void* new_data = realloc(list->data, new_cap * list->elem_size);
    if (!new_data) return false;

    list->data = new_data;
    list->capacity = new_cap;
    return true;
}

bool list_push_back(ArrayList* list, const void* elem){
    if(!list || !elem) return false;

    // Grow if needed.
    if (list->count == list->capacity) {
        size_t new_cap = next_cap(list->capacity);
        if (!list_reserve(list, new_cap)) return false;
    }

    void* dst = (char*)list->data + list->count * list->elem_size;
    memcpy(dst, elem, list->elem_size);
    ++list->count;
    return true;
}

int list_index_of(const ArrayList* list, const void* elem){
    if (!list || !elem) return -1;

    for (size_t i = 0; i < list->count; ++i) {
        const void* cur = (const char*)list->data + i * list->elem_size;
        if (memcmp(cur, elem, list->elem_size) == 0) {
            return (int)i;
        }
    }
    return -1;
}

