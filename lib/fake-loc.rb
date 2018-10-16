#!/usr/bin/env ruby

require "optparse"
require "json"
require "fake-loc-lib"

module App
  def self.main(argv)
    @@obj = FakeLoc.new

    usage if ARGV.empty?

    ARGV.each do |filename|
      puts filename
      process(filename)
    end
  end

  def self.usage
    puts "Usage: #{$0} filename1.json filename2.json ..."
    exit
  end

  def self.process(filename)
    contents = File.read filename
    hash_table = JSON.parse(contents)

    hash_table.each do |key, value|
      hash_table[key] = @@obj.localize(value)
    end
    pp hash_table

    path_to_output_file = build_output_filename(filename)

    File.open(path_to_output_file,"w") do |f|
      f.write(JSON.pretty_generate(hash_table))
    end    
  end

  def self.build_output_filename(filename)
    path_to_output_dir = File.join(File.dirname(filename), "pseudo")
    Dir.mkdir(path_to_output_dir) unless Dir.exist?(path_to_output_dir)
    File.join(path_to_output_dir, File.basename(filename))
  end
end
