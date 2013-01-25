require "spec_helper"

describe Url do
  let(:base) { Url::BASE }

  context "validations" do
    it { should allow("http://example.org").for(:url) }
    it { should_not allow("invalid").for(:url) }
  end

  describe "#uid" do
    subject(:url) { stub_model(Url, :id => 1234) }

    it "returns id in base 36" do
      expect(url.uid).to eql(1234.to_s(base))
    end

    it "returns falsy for new urls" do
      expect(Url.new.uid).not_to be
    end
  end

  describe ".find_by_uid!" do
    let(:url) { urls(:google) }

    it "finds record by its uid" do
      expect(Url.find_by_uid!(url.uid)).to eql(url)
    end

    it "raises error for invalid uid" do
      expect {
        Url.find_by_uid!("_")
      }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "raises error for missing uid" do
      expect {
        Url.find_by_uid!(0.to_s(base))
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "#to_param" do
    let(:url) { stub_model(Url, :uid => "UID") }

    it "returns uid" do
      expect(url.to_param).to eql("UID")
    end
  end
end
