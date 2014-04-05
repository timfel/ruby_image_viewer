#include "SDL.h"

void* SDL_get_pixels(SDL_Surface* screen) {
    return screen->pixels;
}
