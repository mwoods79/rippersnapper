# Rippersnapper

![Rippersnapper](https://github.com/mwoods79/rippersnapper/raw/master/rippersnapper.jpg)

Rippersnapper transforms into a weird upright bipedal shark creature. His finned
twin missile launcher weapon mounts on his back in this mode. He launches his
attack on any URL, ripping it apart with his baby T-Rex arms!

## Installation

Add this line to your application's Gemfile:

    gem 'rippersnapper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rippersnapper

## Usage

    url = Rippersnapper.parse("http://www.rippersnapper.net")
    url.url       # => "http://www.rippersnapper.net" (the original url)
    url.suffix    # => "net"
    url.domain    # => "rippersnapper"

    url = Rippersnapper.parse("http://foo.bar.rippersnapper.co.uk/asdf.html?q=arg")
    url.suffix    # => "co.uk"
    url.domain    # => "rippersnapper"
    url.subdomain # => "foo.bar"
    url.path      # => "/asdf.html?q=arg"

## Notable differences between Rippersnapper and [Domainatrix](https://github.com/pauldix/domainatrix)

One of Rippersnappers goals is to be a compatable API with Domainatrix, but
there are some differences.

1.  Rippersnapper chose the method name `suffix` instead of `public_suffix`.
    Domainatrix is misleading with this name, for instance it will return
    `parliment.uk`, however this is not a public suffix, it is a private suffix
    reserved for Parliment.

2.  Rippersnapper does not parse `http://localhost:3000` at the moment.  I chose
    not to do this b/c `http://localhost.com` is a valid domain, and will parse,
    but `localhost:3000` is not a domain name, it's a hostname.  If you need it
    let me know and I will reconsider

3.  There is no `canonical`, I didn't understand the use case for it, nor why it
    is reversed.  Several google searches came up short on information.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
