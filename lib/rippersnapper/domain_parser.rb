module Rippersnapper
  class DomainParser

    # @params url [String] Url to be parsed
    # @return [self]
    def initialize url
      @url = url
    end

    # @return [String] The suffix for the url taken in initialize
    # @example
    #   Rippersnapper::DomainParser.new("www.google.com").suffix #=> "com"
    def suffix
      @suffix ||= begin
        found = nil
        parts_count.times do |iteration|
          test = url_parts.last(iteration + 1).join(".")
          found = test if suffix_exists?(test)
        end
        found.to_s
      end
    end

    # @return [String] The domain for the url taken in initialize
    # @example
    #   Rippersnapper::DomainParser.new("www.google.com").domain #=> "google"
    def domain
      @domain ||= begin
        remaining = url_parts - suffix_parts
        remaining.last.to_s
      end
    end

    # @return [String] The subdomain for the url taken in initialize
    # @example
    #   Rippersnapper::DomainParser.new("www.google.com").subdomain #=> "www"
    def subdomain
      @subdomain ||= begin
        remaining = url_parts - [domain] - suffix_parts
        remaining.join(".")
      end
    end

    private

    def parts_count
      url_parts.count
    end

    def url_parts
      @url.split('.')
    end

    def suffix_parts
      suffix.split('.')
    end

    def suffix_exists? suffix
      suffix_reader.contains? suffix
    end

    def suffix_reader
      @suffix_reader ||= (Rippersnapper.suffix_file_reader ||
                          SuffixFileReader.new)
    end
  end
end
