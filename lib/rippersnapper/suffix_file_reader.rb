module Rippersnapper
  class SuffixFileReader
    attr_reader :file

    # Reads in the public_suffix and populates public_suffixes for use in
    # #contains
    #
    # @params file [File] file object containing public suffixes
    # @return [self]
    def initialize file = nil
      @file = file || File.open(File.dirname(__FILE__) + "/public_suffix.dat", "r")
      @public_suffixes = Hash.new { false }
      parse_file
    end

    # Used to determin if a given suffix is present in the public_suffix data
    # file
    # @param suffix [String] the suffix which will be checked against the
    # public_suffix file @return [Boolean] true or false depending on inclusion
    # in suffix file
    def contains? suffix
      @public_suffixes[suffix] || begin
        suffix_parts = suffix.split(".")
        suffix_parts.shift
        asterix_suffix = ["*", suffix_parts].join(".")
        @public_suffixes[asterix_suffix]
      end
    end

    private

    # Populates the @public_suffixes instance var.  Each line is set to a key
    # within the variable unless it starts with a // (slash slash)
    # @return [void]
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
