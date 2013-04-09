require 'spec_helper'

module Rippersnapper

  describe SuffixFileValidator do

    context '#initialize' do

      context 'passing in a file' do
        let(:file) { stub :file }
        subject { SuffixFileValidator.new file }
        its(:file) { should be file}
      end

      context 'file default' do
        subject { SuffixFileValidator.new }
        its(:file) { should be_a_kind_of File }
      end
    end


  end

end
