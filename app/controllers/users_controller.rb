class UsersController < ApplicationController
  def index
    @users = User.all

    render("users/index.html.erb")
  end

  def show
    now= Date.today
    @year= now.year


    if params[:id] == nil # coming from the home page ("/")
      @user = current_user # don't have to worry about whether user signed in because of security settingsin ApplicationController
    else # coming from "/user/:id"
      @user = User.find(params[:id])
    end

    render("users/show.html.erb")
  end

end
