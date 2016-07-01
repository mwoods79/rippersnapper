describe Rippersnapper do
  describe '::parse' do
    subject { Rippersnapper.parse "www.google.com" }
    it { is_expected.to be_a_kind_of Rippersnapper::Url }
  end

  describe "::load_suffixes" do
    subject { described_class.load_suffixes }
    after { described_class.unload_suffixes }
    it { is_expected.to be_a_kind_of described_class::SuffixFileReader }
  end

  describe "::suffix_file_reader" do
    subject { described_class.suffix_file_reader }
    it { is_expected.to be_nil }

    context "with loaded suffixes" do
      before { described_class.load_suffixes }
      after { described_class.unload_suffixes }
      it { is_expected.to be_a_kind_of described_class::SuffixFileReader }
    end
  end

  describe "::unload_suffixes" do
    before { described_class.load_suffixes }
    after { described_class.unload_suffixes }

    it "unloads suffixes" do
      expect(described_class.suffix_file_reader).to_not be_nil
      described_class.unload_suffixes
      expect(described_class.suffix_file_reader).to be_nil
    end
  end
end
