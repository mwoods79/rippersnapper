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
      its(:scheme) { should eq "http" }
      its(:host) { should eq "drive.google.com" }
      its(:suffix) { should eq "com" }
      its(:domain) { should eq "google" }
      its(:subdomain) { should eq "drive" }
    end

    context "without a scheme" do
      subject { Url.new "www.google.com/micah" }
      its(:url) { should eq "http://www.google.com/micah" }
      its(:path) { should eq "/micah" }
      its(:scheme) { should eq "http" }
      its(:host) { should eq "www.google.com" }
      its(:suffix) { should eq "com" }
      its(:domain) { should eq "google" }
      its(:subdomain) { should eq "www" }
    end

    context "with a query string" do
      subject { Url.new "www.google.com/micah?date=today" }
      its(:path) { should eq "/micah?date=today" }
      its(:suffix) { should eq "com" }
      its(:domain) { should eq "google" }
    end

    context "when url is nil" do
      subject {Url.new nil}
      its(:url) { should eq "" }
      its(:path) { should eq "" }
      its(:scheme) { should eq "" }
      its(:host) { should eq "" }
      its(:suffix) { should eq "" }
      its(:domain) { should eq "" }
      its(:subdomain) { should eq "" }
    end

    context "whith ip address" do
      subject { Url.new "http://10.0.1.1/" }
      its(:url) { should eq "http://10.0.1.1/" }
      its(:path) { should eq "/" }
      its(:scheme) { should eq "http" }
      its(:host) { should eq "10.0.1.1" }
      its(:suffix) { should eq "" }
      its(:domain) { should eq "10.0.1.1" }
      its(:subdomain) { should eq "" }
    end
  end
end
