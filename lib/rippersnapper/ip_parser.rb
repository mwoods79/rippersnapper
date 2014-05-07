module Rippersnapper
  class IpParser

    attr_reader :host

    def initialize host
      @host = host
    end

    def suffix
      ""
    end

    def domain
      host
    end

    def subdomain
      ""
    end

  end
end
