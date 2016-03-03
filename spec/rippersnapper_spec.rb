describe Rippersnapper do
  describe '::parse' do
    subject { Rippersnapper.parse "www.google.com" }
    it { is_expected.to be_a_kind_of Rippersnapper::Url }
  end
end
