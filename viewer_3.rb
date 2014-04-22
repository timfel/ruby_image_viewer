require "ffi"
require "libz3"

$LOAD_PATH << File.dirname(__FILE__)
require "bmp"
require "sdl"

sdl = SDL.new
bmps = Dir["#{File.expand_path(ARGV[0])}/*.bmp"].sort.map do |file|
  bmp = BMP.new(file)
  always { bmp.width.? * bmp.height * (bmp.depth / 8) >= bmp.data.size }
  always { bmp.depth == 24 || bmp.depth == 16 || bmp.depth = 8 }
  bmp
end
i = 0

sdl.draw_pixels bmps[0].width, bmps[0].height, bmps[0].depth, bmps[0].data

while (k = sdl.get_event) != 0
  next if k == 2

  i = (i + k) % bmps.size
  p = bmps[i]

  sdl.draw_pixels p.width, p.height, p.depth, p.data

  sdl.delay 5
end
