require "spec_helper"

describe "Create short url" do
  context "for a new url" do
    before do
      visit root_path
      fill_in t("form.labels.url.url"), :with => "http://example.org"
      click_button t("helpers.submit.url.create")
    end

    it "redirects to the url details page" do
      expect(current_path).to match(%r[/url/.+])
    end

    it "displays success message" do
      expect(page).to have_content(t("flash.urls.create.notice"))
    end

    it "displays shortened url" do
      expect(page).to have_content(Url.last.uid)
    end
  end

  context "for an existing url" do
    let(:url) { urls(:google) }

    before do
      visit root_path
      fill_in t("form.labels.url.url"), :with => url.url
      click_button t("helpers.submit.url.create")
    end

    it "redirects to the url details page" do
      expect(current_path).to eql(url_path(url))
    end

    it "displays success message" do
      expect(page).to have_content(t("flash.urls.create.notice"))
    end

    it "displays shortned url" do
      expect(page).to have_content(url.uid)
    end
  end

  context "for an invalid url" do
    before do
      visit root_path
      click_button t("helpers.submit.url.create")
    end

    it "renders form page" do
      expect(current_path).to eql(new_url_path)
    end

    it "displays error message" do
      expect(page).to have_content(t("activerecord.errors.messages.invalid"))
    end
  end
end
