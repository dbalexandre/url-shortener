UrlShortener::Application.routes.draw do
  root :to => "Urls#new"

  get "/url/:uid", :to => "Urls#show", :as => :url
  post "/url/new", :to => "Urls#create", :as => :new_url
  get "/:uid", :to => "Urls#expand", :as => :expand
end
