require "spec_helper"

describe ApplicationController do
  context "rescue ActiveRecord::RecordNotFound" do
    controller do
      def index
        raise ActiveRecord::RecordNotFound
      end
    end

    it "renders 404" do
      get :index
      expect(response.status).to eql(404)
    end
  end
end
