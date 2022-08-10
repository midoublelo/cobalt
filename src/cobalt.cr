# TODO: Write documentation for `Cobalt`
require "clim"

module Cobalt
  VERSION = "0.1.0"
  class Cli < Clim
    main do
      desc "Cobalt Programming Language"
      usage "cobalt [command] [file] [arguments] ..."
      version "Cobalt Version #{Cobalt::VERSION}", short: "-v"
      run do |opts, args|
        puts opts.help_string
      end
      sub "run" do
        desc "Run a Cobalt program"
        usage "cobalt run [file]"
        argument "file", type: String, desc: "Path to file"
        run do |opts, args|
          begin
            fileInput = args.file.not_nil!.chomp
            content = File.read(fileInput)
            puts content
          rescue NilAssertionError
            puts "[Error] Missing file input"
            puts opts.help_string
          rescue File::NotFoundError
            puts "[Error] File not found"
          end
        end
      end
    end
  end
end

Cobalt::Cli.start(ARGV)