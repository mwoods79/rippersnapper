module Rippersnapper

  class SuffixFileValidator
    attr_reader :file

    def initialize file = nil
      @file = file || File.open(File.dirname(__FILE__) + "/public_suffix.dat", 'r')
      @public_suffixes = Hash.new { false }
      parse_file
    end

    def contains? suffix
      @public_suffixes[suffix]
    end

    private

    def parse_file
      file.each_line do |line|
        line = line.strip
        unless line.empty? || (line =~ /\/\//)
          @public_suffixes[line] = true
        end
      end
    end

  end

end
