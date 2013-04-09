module Rippersnapper

  class SuffixFileValidator
    attr_reader :file

    def initialize file = nil
      @file = file || File.open(File.dirname(__FILE__) + "/public_suffix.dat", 'r')
    end

  end

end
