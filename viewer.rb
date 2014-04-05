require "ffi"

module SDL
  extend FFI::Library

  ffi_lib "SDL"

  attach_function :SDL_Init, [:uint32], :int
  attach_function :SDL_SetVideoMode, [:int, :int, :int, :uint32], :pointer

  DOUBLEBUF   = 0x40000000
  INIT_VIDEO  = 0x00000020

  attach_function :SDL_Flip, [:pointer], :int
  attach_function :SDL_Delay, [:uint32], :void

  ffi_lib "./sdlpixels.so"

  attach_function :SDL_get_pixels, [:pointer], :pointer
end

filename = ARGV[0]
image_w = 1024
image_h = 768
image_d = 32

fail unless SDL.SDL_Init(SDL::INIT_VIDEO) == 0
fail unless screen = SDL.SDL_SetVideoMode(image_w, image_h, image_d, SDL::DOUBLEBUF)

pixels = SDL::SDL_get_pixels screen
200.times do |i|
  pixels.put_int8(i, 255)
end

SDL.SDL_Flip(screen)
SDL.SDL_Delay(2500)
