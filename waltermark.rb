require 'rubygems'
require 'mini_magick'

baseDir = '.'
files = Dir.glob("images/originals/*.jpg")
destinationFolder = 'images/processed'
logomarca = 'images/logo.png'

#configuration
top = 5 #top margin

files.each do |file|
    img = MiniMagick::Image.open(file)

    left = img.width - 155
    type = img.type
    name = "image-#{rand(36**8).to_s(36)}.#{type}"

    puts name if resizeImage = true

    img.draw 'image Over ' + left.to_s + ', ' + top.to_s + ' 0,0 images/you-logo.png'
    img.write("#{destinationFolder}/#{name}")
    puts "#{name} - OK!"
end