require "optparse"
require "json"
require "fake-loc-lib"

module App
  class FileReader
    def initialize(filename)
      @filename = filename
    end

    def read
      contents   = File.read @filename
      hash_table = JSON.parse contents
    end
  end

  class FileWriter
    def initialize(file_path)
      @file_path = file_path
    end

    def write(hash_table)
      File.open(@file_path,"w") do |file|
        pretty_table = JSON.pretty_generate hash_table
        file.write pretty_table
      end
    end
  end

  def self.main(argv)
    usage if ARGV.empty?

    @@decorator = FakeLoc.new

    ARGV.each do |filename|
      puts filename
      process filename
    end
  end

  def self.usage
    puts "Usage: #{$0} filename1.json filename2.json ..."
    exit
  end

  def self.process(filename)
    string_resources = FileReader.new(filename).read

    string_resources.each do |key, text_value|
      string_resources[key] = @@decorator.localize text_value
    end

    # TODO display string resources if debug flag is ON
    # pp string_resources
    puts JSON.pretty_generate string_resources

    path_to_output_file = build_output_filename filename

    FileWriter.new(path_to_output_file).write string_resources
  end

  def self.build_output_filename(filename)
    path_to_output_dir = File.join(File.dirname(filename), "pseudo")
    Dir.mkdir(path_to_output_dir) unless Dir.exist?(path_to_output_dir)
    File.join(path_to_output_dir, File.basename(filename))
  end
end
