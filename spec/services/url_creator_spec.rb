require "./app/services/url_creator"

describe UrlCreator do
  describe ".create" do
    let(:attrs) { { :url => "URL"} }
    let(:finder) { mock("finder") }
    let(:url) { mock("url") }

    context "when url doesn't exist" do
      before { finder.stub :find_by_url }

      it "creates url" do
        finder
          .should_receive(:create)
          .with(:url => "URL")

        UrlCreator.create(attrs, finder)
      end

      it "returns created url" do
        finder.stub :create => url
        returned_url = UrlCreator.create(attrs, finder)

        expect(returned_url).to eql(url)
      end
    end

    context "when url exists" do
      before { finder.stub :find_by_url => url }

      it "finds by url" do
        finder
          .should_receive(:find_by_url)
          .with("URL")

        UrlCreator.create(attrs, finder)
      end

      it "returns existing url" do
        returned_url = UrlCreator.create(attrs, finder)
        expect(returned_url).to eql(url)
      end
    end
  end
end
