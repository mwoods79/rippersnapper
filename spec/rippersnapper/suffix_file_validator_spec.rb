require "spec_helper"
require "stringio"

module Rippersnapper

  describe SuffixFileReader do

    describe "#initialize" do

      context "passing in a file" do
        let(:file) { double :file, each_line: [] }
        subject { SuffixFileReader.new file }

        describe "#file" do
          subject { super().file }
          it { is_expected.to be file}
        end
      end

      context "file default" do
        subject { SuffixFileReader.new }

        describe "#file" do
          subject { super().file }
          it { is_expected.to be_a_kind_of File }
        end
      end
    end

    describe "#contains?" do
      subject { SuffixFileReader.new }

      it { is_expected.to respond_to :contains? }

      context "matching valid data" do

        it "matches a single suffix" do
          expect(subject.contains?("com")).to be_truthy
        end

        it "matches a nested suffix" do
          expect(subject.contains?("la.us")).to be_truthy
        end

        it "matches a suffix with a single asterix" do
          expect(subject.contains?("whatever.uk")).to be_truthy
        end

        it "matches a suffix with multiple asterix" do
          expect(subject.contains?("whatever.sapporo.jp")).to be_truthy
        end
      end

      context "rejecting invalid data" do
        it "doesn't match suffix that is not in file" do
          expect(subject.contains?("baz")).to be_falsey
        end

        it "doesn't match complex suffix that are not in file" do
          expect(subject.contains?("doesnt.exist.sapporo.jp")).to be_falsey
        end

        it "doesn't match comments" do
          expect(subject.contains?("// comment")).to be_falsey
        end

        it "doesn't match empty lines" do
          expect(subject.contains?("")).to be_falsey
        end
      end
    end
  end
end
