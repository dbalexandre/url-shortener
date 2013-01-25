class UrlsController < ApplicationController
  def show
    @url = Url.find_by_uid!(params[:uid])
  end

  def new
    @url = Url.new
  end

  def create
    @url = UrlCreator.create(params[:url])

    if @url.persisted?
      redirect_to url_path(@url), :notice => t("flash.urls.create.notice")
    else
      render :new
    end
  end

  def expand
    @url = Url.find_by_uid!(params[:uid])
    redirect_to @url.url
  end
end
