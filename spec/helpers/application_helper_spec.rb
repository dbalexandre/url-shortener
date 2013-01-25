require "spec_helper"

describe ApplicationHelper do
  describe "#form_erros" do
    let(:record) { mock("record instance") }
    let(:form_errors) { mock("form_errors") }

    it "initializes FormErrors with record" do
      FormErrors
        .should_receive(:new)
        .with(record)
        .and_return(stub.as_null_object)

      helper.form_errors(record)
    end

    it "render form errors" do
      FormErrors.stub :new => form_errors
      form_errors
        .should_receive(:render)
        .with(helper)

      helper.form_errors(record)
    end
  end
end
