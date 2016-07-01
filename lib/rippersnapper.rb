require "rippersnapper/version"
require "rippersnapper/suffix_file_reader"
require "rippersnapper/url"
require "rippersnapper/domain_parser"
require "rippersnapper/ip_parser"

module Rippersnapper
  def self.parse url
    Url.new url
  end

  # Load public suffix file into class instance var to be reused
  #
  # @return [void]
  def self.load_suffixes file = nil
    @suffix_file_reader = SuffixFileReader.new(file)
  end

  # Accessor for loaded suffix reader
  #
  # @return [SuffixFileReader]
  # @return [nil] if not loaded
  def self.suffix_file_reader
    @suffix_file_reader
  end

  # Unload public suffix file
  #
  # @return [void]
  def self.unload_suffixes
    @suffix_file_reader = nil
  end
end
