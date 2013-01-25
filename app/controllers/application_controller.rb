class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  private

  def not_found
    render :file => Rails.root.join("public/404.html"),
      :status => :not_found
  end
end
