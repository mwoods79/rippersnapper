module Rippersnapper

  ###
  # Single Responsibility:
  #   Finds a suffix match in a list of suffixes

  class SuffixFileReader
    attr_reader :file

    def initialize file = nil
      @file = file || File.open(File.dirname(__FILE__) + "/public_suffix.dat", 'r')
      # Recursive hash of hashes http://stackoverflow.com/a/170240/973860
      #@public_suffixes = Hash.new(&(p=lambda{|h,k| h[k] = Hash.new(&p)}))
      @public_suffixes = Hash.new { false }
      parse_file
    end

    def contains? suffix
      @public_suffixes[suffix] || begin
        suffix_parts = suffix.split('.')
        suffix_parts.shift
        asterix_suffix = ["*", suffix_parts].join('.')
        @public_suffixes[asterix_suffix]
      end
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
