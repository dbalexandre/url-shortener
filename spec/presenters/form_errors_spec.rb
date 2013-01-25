require "./app/presenters/form_errors"

describe FormErrors do
  let(:record) { mock("record instance") }
  let(:view_context) { mock("view_context") }

  subject(:form_errors) { FormErrors.new(record) }

  describe "#errors" do
    context "with errors" do
      it "returns error messages" do
        record.stub :errors => {:url => "Invalid URL!"}
        expect(form_errors.errors).to eql(["Invalid URL!"])
      end
    end

    context "without errors" do
      it "returns empty array" do
        record.stub :errors => {}
        expect(form_errors.errors).to eql([])
      end
    end
  end

  describe "#render" do
    before do
      form_errors.stub :errors => ["MESSAGE"]
    end

    context "with errors" do
      it "renders partial" do
        view_context
          .should_receive(:render)
          .with("shared/form_errors", :errors => ["MESSAGE"])

        form_errors.render(view_context)
      end
    end

    context "without errors" do
      before do
        form_errors.stub :errors => []
      end

      it "skips rendering" do
        view_context.should_not_receive(:render)
        form_errors.render(view_context)
      end
    end
  end
end
