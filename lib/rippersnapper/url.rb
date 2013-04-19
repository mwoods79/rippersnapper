require 'URI'

module Rippersnapper
  class Url

    def initialize url
      @url = url.to_s
    end

    def uri
      @uri ||= URI.parse url
    end

    def url
      return @url if @url =~ /:\/\// || @url.empty?
      "http://#{@url}"
    end

    def suffix
      parsed_domain.suffix
    end

    def domain
      parsed_domain.domain
    end

    def subdomain
      parsed_domain.subdomain
    end

    def scheme
      uri.scheme || ""
    end

    def host
      uri.host || ""
    end

    def path
      return "#{uri.path}?#{uri.query}" if uri.query
      uri.path
    end

    private

    def parsed_domain
      @parsed_domain ||= DomainParser.new host
    end
  end
end
