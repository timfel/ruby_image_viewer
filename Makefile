default: sdlpixels.so

sdlpixels.o: sdlpixels.c
	gcc -fPIC `sdl-config --cflags` -o sdlpixels.o -c sdlpixels.c

sdlpixels.so: sdlpixels.o
	gcc -shared -o sdlpixels.so sdlpixels.o

clean:
	rm -f sdlpixels.so sdlpixels.o
