require 'spec_helper'

module Rippersnapper

  describe Url do
    it { should respond_to :domain }
    it { should respond_to :scheme }
    it { should respond_to :host }
    it { should respond_to :path }
    it { should respond_to :url }
    it { should respond_to :suffix }
    it { should respond_to :subdomain }
  end
end
