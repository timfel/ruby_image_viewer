module SDL
  extend FFI::Library

  ffi_lib "SDL"

  attach_function :SDL_Init, [:uint32], :int
  attach_function :SDL_SetVideoMode, [:int, :int, :int, :uint32], :pointer

  DOUBLEBUF   = 0x40000000
  INIT_VIDEO  = 0x00000020

  attach_function :SDL_Flip, [:pointer], :int
  attach_function :SDL_Delay, [:uint32], :void

  ffi_lib "./libsdlpixels.so"

  attach_function :SDL_get_pixels, [:pointer], :pointer
  attach_function :SDL_get_event, [], :int
end
