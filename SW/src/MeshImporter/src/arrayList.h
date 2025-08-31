/* Copyright (C) 2025, Evangelos Kolovos
 * This library is distributed under the MIT License.
 *
 * ------------ Minimal, POD-friendly dynamic array -----------
 * This container stores elements by value in a contiguous void* buffer.
 * It is suitable for trivially copyable types (POD / blit-safe data).
 */


#pragma once
#include <stddef.h>
#include <stdbool.h>


typedef struct {
    void*   data;       //Pointer to the contiguous backing storage
    size_t  count;      //Number of elements stored
    size_t  capacity;   //Allocated capacity in elements
    size_t  elem_size;  //Size in bytes of a single element
} ArrayList;




// ----------------- Public API ------------------


/* Creates a new list for elements of fixed size.

   Parameters:
  	 elem_size   : Size in bytes of one element; must be > 0.
     initial_cap : Optional initial capacity in elements (0 for lazy allocation).

   Returns:   Pointer to a new list on success, or NULL on failure.
*/
ArrayList* list_create(size_t elem_size, size_t initial_cap);


/* Destroys a list and free its backing storage. */
void list_destroy(ArrayList* list);


/* Ensure capacity is at least new_cap elements.

   Parameters:
     list       The list (must be non-NULL).
     new_cap    Desired minimum capacity in elements.
 */
bool list_reserve(ArrayList* list, size_t new_cap);


/* Appends one element by value to the end of the list.

   Parameters:
     list
     elem:  Pointer to the source element to copy from.

   Behavior:
    - Grows capacity automatically using a ~1.5x growth policy.
    - Copies `elem_size` bytes from `elem` into the next slot.
 */
bool list_push_back(ArrayList* list, const void* elem);



// Linear search for the first element byte-equal to elem
// Returns: index in [0, count) on success, -1 if not found or on error
// Note: This uses memcmp over elem_size bytes, it works for POD/blit-safe types only
int list_index_of(const ArrayList* list, const void* elem);
