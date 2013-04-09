class Url
  attr_accessor :subdomain, :domain, :suffix, :scheme, :host

  def initialize url
    @url = url
  end

  def uri
    @uri ||= URI.parse url
  end

  def url
    return @url if @url =~ /:\/\//
    "http://#{@url}"
  end

  def path
    return "#{uri.path}?#{uri.query}" if uri.query
    uri.path
  end
end
