require 'spec_helper'

module Rippersnapper

  describe SuffixFileValidator do

    context '#initialize' do

      context 'passing in a file' do
        let(:file) { stub :file }
        subject { SuffixFileValidator.new file }
        its(:file) { should be file}
      end
    end

  end

end
