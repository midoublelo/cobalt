# TODO: Write documentation for `Cobalt`
module Cobalt
  VERSION = "0.1.0"

  puts "Cobalt v#{VERSION}"
  print "Enter a file name: "
  fileInput = gets.not_nil!.chomp
  content = File.read(fileInput)
  puts content
end
