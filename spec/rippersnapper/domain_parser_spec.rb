require 'spec_helper'

module Rippersnapper

  describe DomainParser do

    context "simple domain" do
      subject { DomainParser.new "www.google.com" }
      #its(:subdomain) { should eq "www" }
      #its(:domain) { should eq "google" }
      its(:suffix) { should eq "com" }
    end

    context "complex domain" do
      subject { DomainParser.new "my.drive.google.whatever.sapporo.jp" }
      #its(:subdomain) { should eq "my.drive" }
      #its(:domain) { should eq "google" }
      its(:suffix) { should eq "whatever.sapporo.jp" }
    end
  end
end
