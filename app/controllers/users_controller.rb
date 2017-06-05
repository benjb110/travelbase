class UsersController < ApplicationController
  def index

    @q = User.ransack(params[:q])
    @users = @q.result

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


    @total_days = 0
    @user.trips.each do |trip|
      @total_days += (trip.end_date-trip.start_date).to_i
    end


    @countries = []
    @user.trips.each do |trip|
      if @countries.include?(trip.country)
      else
        @countries.push(trip.country)
      end
    end


        #code





        render("users/show.html.erb")
      end

    end
