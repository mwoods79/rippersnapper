require "rippersnapper/version"
require "rippersnapper/suffix_file_reader"
require "rippersnapper/url"
require "rippersnapper/domain_parser"

module Rippersnapper
  def self.parse url
    Url.new url
  end
end
