require "spec_helper"

describe "Expand short url" do
  context "for existing urls" do
    let(:url) { urls(:google) }

    before do
      visit url_path(url)
      click_link t("actions.visit")
    end

    it "redirects to expanded url" do
      expect(current_url).to eql(url.url)
    end
  end

  context "for missing urls" do
    before do
      visit expand_path("_")
    end

    it "returns 404" do
      expect(status_code).to eql(404)
    end
  end
end
