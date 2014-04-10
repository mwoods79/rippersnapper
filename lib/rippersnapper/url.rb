require 'uri'

module Rippersnapper
  class Url

    # @params url [String] The URL to be parsed
    def initialize url
      @url = url.to_s
    end

    # URI object from url passed to initialize
    # @return [URI] the URI object
    # @example
    #  uri = Rippersnapper::Url.new("www.google.com?q=blah")
    #  uri.scheme #=> "https"
    #  uri.host #=> "www.google.com"
    #  uri.path #=> "/"
    #  uri.query #=> "q=blah"
    def uri
      @uri ||= URI.parse url
    end

    # If url has a scheme use it if not assume http
    # @return [String] The url to be processed
    def url
      return @url if @url =~ /:\/\// || @url.empty?

      # sensible default
      "http://#{@url}"
    end

    # Pass through to DomainParser object
    # {Rippersnapper::DomainParser#suffix} see here for more details
    def suffix
      parsed_domain.suffix
    end

    # Pass through to DomainParser object
    # {Rippersnapper::DomainParser#domain} see here for more details
    def domain
      parsed_domain.domain
    end

    # Pass through to DomainParser object
    # {Rippersnapper::DomainParser#subdomain} see here for more details
    def subdomain
      parsed_domain.subdomain
    end

    # convenience method to access URI scheme
    # @example
    #   Rippersnapper::Url.new("https://www.google.com").scheme #=> "https"
    # See {Rippersnapper::Url#uri} for more information
    # @return [String]
    def scheme
      uri.scheme || ""
    end

    # convenience method to access URI host
    # @example
    #   Rippersnapper::Url.new("https://www.google.com").host #=> "google"
    # See {Rippersnapper::Url#uri} for more information
    # @return [String]
    def host
      uri.host || ""
    end

    # construct path from uri query and uri path
    # @return [String]
    def path
      return "#{uri.path}?#{uri.query}" if uri.query
      uri.path
    end

    # convenience method to access URI port
    # @example
    #   Rippersnapper::Url.new("https://www.google.com").port #=> 443
    # See {Rippersnapper::Url#uri} for more information
    # @return [String]
    def port
      uri.port
    end

    private

    def parsed_domain
      @parsed_domain ||= DomainParser.new host
    end
  end
end
