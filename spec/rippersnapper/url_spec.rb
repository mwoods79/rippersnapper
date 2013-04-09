require 'spec_helper'

module Rippersnapper

  describe Url do
    subject { Url.new "www.google.com" }

    it { should respond_to :domain }
    it { should respond_to :scheme }
    it { should respond_to :host }
    it { should respond_to :path }
    it { should respond_to :url }
    it { should respond_to :suffix }
    it { should respond_to :subdomain }


    context "with a scheme" do
      subject { Url.new "http://drive.google.com/micah" }
      its(:url) { should eq "http://drive.google.com/micah" }
      its(:path) { should eq "/micah" }
    end

    context "without a scheme" do
      subject { Url.new "www.google.com/micah" }
      its(:url) { should eq "http://www.google.com/micah" }
      its(:path) { should eq "/micah" }
    end

    context "with a query string" do
      subject { Url.new "www.google.com/micah?date=today" }
      its(:path) { should eq "/micah?date=today" }
    end
  end
end
