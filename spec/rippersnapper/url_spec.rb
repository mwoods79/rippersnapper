require 'spec_helper'

module Rippersnapper

  describe Url do
    subject { Url.new "www.google.com" }

    it { is_expected.to respond_to :domain }
    it { is_expected.to respond_to :scheme }
    it { is_expected.to respond_to :host }
    it { is_expected.to respond_to :path }
    it { is_expected.to respond_to :url }
    it { is_expected.to respond_to :suffix }
    it { is_expected.to respond_to :subdomain }
    it { is_expected.to respond_to :port }

    context "with a scheme" do
      subject { Url.new "http://drive.google.com:91/micah" }

      describe '#url' do
        subject { super().url }
        it { is_expected.to eq "http://drive.google.com:91/micah" }
      end

      describe '#path' do
        subject { super().path }
        it { is_expected.to eq "/micah" }
      end

      describe '#scheme' do
        subject { super().scheme }
        it { is_expected.to eq "http" }
      end

      describe '#host' do
        subject { super().host }
        it { is_expected.to eq "drive.google.com" }
      end

      describe '#suffix' do
        subject { super().suffix }
        it { is_expected.to eq "com" }
      end

      describe '#domain' do
        subject { super().domain }
        it { is_expected.to eq "google" }
      end

      describe '#subdomain' do
        subject { super().subdomain }
        it { is_expected.to eq "drive" }
      end

      describe '#port' do
        subject { super().port }
        it { is_expected.to eq 91 }
      end
    end

    context "without a scheme" do
      subject { Url.new "www.google.com/micah" }

      describe '#url' do
        subject { super().url }
        it { is_expected.to eq "http://www.google.com/micah" }
      end

      describe '#path' do
        subject { super().path }
        it { is_expected.to eq "/micah" }
      end

      describe '#scheme' do
        subject { super().scheme }
        it { is_expected.to eq "http" }
      end

      describe '#host' do
        subject { super().host }
        it { is_expected.to eq "www.google.com" }
      end

      describe '#suffix' do
        subject { super().suffix }
        it { is_expected.to eq "com" }
      end

      describe '#domain' do
        subject { super().domain }
        it { is_expected.to eq "google" }
      end

      describe '#subdomain' do
        subject { super().subdomain }
        it { is_expected.to eq "www" }
      end

      describe '#port' do
        subject { super().port }
        it { is_expected.to eq 80 }
      end
    end

    context "with a query string" do
      subject { Url.new "www.google.com/micah?date=today" }

      describe '#path' do
        subject { super().path }
        it { is_expected.to eq "/micah?date=today" }
      end

      describe '#suffix' do
        subject { super().suffix }
        it { is_expected.to eq "com" }
      end

      describe '#domain' do
        subject { super().domain }
        it { is_expected.to eq "google" }
      end
    end

    context "when url is nil" do
      subject {Url.new nil}

      describe '#url' do
        subject { super().url }
        it { is_expected.to eq "" }
      end

      describe '#path' do
        subject { super().path }
        it { is_expected.to eq "" }
      end

      describe '#scheme' do
        subject { super().scheme }
        it { is_expected.to eq "" }
      end

      describe '#host' do
        subject { super().host }
        it { is_expected.to eq "" }
      end

      describe '#suffix' do
        subject { super().suffix }
        it { is_expected.to eq "" }
      end

      describe '#domain' do
        subject { super().domain }
        it { is_expected.to eq "" }
      end

      describe '#subdomain' do
        subject { super().subdomain }
        it { is_expected.to eq "" }
      end

      describe '#port' do
        subject { super().port }
        it { is_expected.to be_nil }
      end
    end

    context "whith ip address" do
      subject { Url.new "http://10.0.1.1/" }

      describe '#url' do
        subject { super().url }
        it { is_expected.to eq "http://10.0.1.1/" }
      end

      describe '#path' do
        subject { super().path }
        it { is_expected.to eq "/" }
      end

      describe '#scheme' do
        subject { super().scheme }
        it { is_expected.to eq "http" }
      end

      describe '#host' do
        subject { super().host }
        it { is_expected.to eq "10.0.1.1" }
      end

      describe '#suffix' do
        subject { super().suffix }
        it { is_expected.to eq "" }
      end

      describe '#domain' do
        subject { super().domain }
        it { is_expected.to eq "10.0.1.1" }
      end

      describe '#subdomain' do
        subject { super().subdomain }
        it { is_expected.to eq "" }
      end
    end
  end
end
