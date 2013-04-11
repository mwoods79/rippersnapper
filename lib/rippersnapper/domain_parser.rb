module Rippersnapper
  class DomainParser
    attr_reader :domain, :subdomain

    def initialize url
      @url = url
    end

    def suffix
      @suffix ||= begin
        found = nil
        parts_count.times do |iteration|
          test = url_parts.last(iteration + 1).join(".")
          found = test if suffix_exists?(test)
        end
        found
      end
    end

    private

    def parts_count
      url_parts.count
    end

    def url_parts
      @url.split('.')
    end

    def suffix_exists? suffix
      suffix_reader.contains? suffix
    end

    def suffix_reader
      @suffix_reader ||= SuffixFileReader.new
    end
  end
end
