require 'spec_helper'
require 'stringio'

module Rippersnapper

  describe SuffixFileValidator do

    context '#initialize' do

      context 'passing in a file' do
        let(:file) { stub :file, each_line: [] }
        subject { SuffixFileValidator.new file }
        its(:file) { should be file}
      end

      context 'file default' do
        subject { SuffixFileValidator.new }
        its(:file) { should be_a_kind_of File }
      end
    end

    context '#contains?' do
      let(:file) { StringIO.new "//coment\ncom\nco\nco.uk" }
      subject { SuffixFileValidator.new file }

      it { should respond_to :contains? }

      it 'matches valid data' do
        expect(subject.contains?("com")).to be_true
      end

      it "doesn't match invalid data" do
        expect(subject.contains?("foo")).to be_false
      end

      it "doesn't match comments" do
        expect(subject.contains?("// comment")).to be_false
      end

      it "doesn't match empty lines" do
        expect(subject.contains?("")).to be_false
      end
    end

  end

end
