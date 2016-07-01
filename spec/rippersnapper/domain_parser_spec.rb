require "spec_helper"

module Rippersnapper

  describe DomainParser do

    context "simple domain" do
      subject { DomainParser.new "www.google.com" }

      describe "#subdomain" do
        subject { super().subdomain }
        it { is_expected.to eq "www" }
      end

      describe "#domain" do
        subject { super().domain }
        it { is_expected.to eq "google" }
      end

      describe "#suffix" do
        subject { super().suffix }
        it { is_expected.to eq "com" }
      end
    end

    context "complex domain" do
      subject { DomainParser.new "my.drive.google.whatever.sapporo.jp" }

      describe "#subdomain" do
        subject { super().subdomain }
        it { is_expected.to eq "my.drive" }
      end

      describe "#domain" do
        subject { super().domain }
        it { is_expected.to eq "google" }
      end

      describe "#suffix" do
        subject { super().suffix }
        it { is_expected.to eq "whatever.sapporo.jp" }
      end
    end

    context "empty url" do
      subject { DomainParser.new "" }

      describe "#subdomain" do
        subject { super().subdomain }
        it { is_expected.to eq "" }
      end

      describe "#domain" do
        subject { super().domain }
        it { is_expected.to eq "" }
      end

      describe "#suffix" do
        subject { super().suffix }
        it { is_expected.to eq "" }
      end
    end

    context "preloaded suffix file" do
      before { Rippersnapper.load_suffixes }
      after { Rippersnapper.unload_suffixes }

      subject { described_class.new("").send(:suffix_reader) }

      it { is_expected.to be_kind_of SuffixFileReader }

      it "uses the preloaded reader" do
        expect(subject.object_id)
          .to eq(Rippersnapper.suffix_file_reader.object_id)
      end
    end
  end
end
