Rails.application.routes.draw do
  # Routes for the Country resource:
  # CREATE
  get "/countries/new", :controller => "countries", :action => "new"
  post "/create_country", :controller => "countries", :action => "create"

  # READ
  get "/countries", :controller => "countries", :action => "index"
  get "/countries/:id", :controller => "countries", :action => "show"

  # UPDATE
  get "/countries/:id/edit", :controller => "countries", :action => "edit"
  post "/update_country/:id", :controller => "countries", :action => "update"

  # DELETE
  get "/delete_country/:id", :controller => "countries", :action => "destroy"
  #------------------------------

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
