Stupid BMP->SDL_Surface dumping in 3 versions

1st version shows bmp files, but broken files trip it up with buffer overflows
2nd version ensures that buffers don't overflow
3rd version fixes color depth if required
