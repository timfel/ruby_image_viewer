$LOAD_PATH << File.dirname(__FILE__)
require "ffi"
require "bmp_image"
require "sdl"

bmps = Dir["#{File.expand_path(ARGV[0])}/*.bmp"].sort.map do |file|
  BMPImage.new(file)
end


i = -1
bmp = bmps[0]

fail unless SDL.SDL_Init(SDL::INIT_VIDEO) == 0
fail unless screen = SDL.SDL_SetVideoMode(bmp.width, bmp.height, bmp.depth, SDL::DOUBLEBUF)

while (k = SDL.SDL_get_event) != 0
  next if k == 2

  i = (i + k) % bmps.size
  bmp = bmps[i]
  fail unless screen = SDL.SDL_SetVideoMode(bmp.width, bmp.height, bmp.depth, SDL::DOUBLEBUF)
  pixels = SDL::SDL_get_pixels screen

  bmp.data.each_byte.each_with_index do |char, i|
    pixels.put_int8(i, char)
  end

  SDL.SDL_Flip(screen)
  SDL.SDL_Delay(5)
end
