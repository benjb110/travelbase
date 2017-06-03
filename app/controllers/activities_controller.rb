class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all

    render("activities/index.html.erb")
  end

  def show
    @activity = Activity.find(params[:id])

    render("activities/show.html.erb")
  end

  def new
    @activity = Activity.new


    render("activities/new.html.erb")
  end

  def create
    @activity = Activity.new

    @activity.name = params[:name]
    @activity.address = params[:address]
    @activity.trip_id = params[:trip_id]
    @activity.when_happened = params[:when_happened]
    @activity.review = params[:review]
    @activity.activity_rating = params[:activity_rating]
    @activity.recommend = params[:recommend]
    @activity.photos = params[:photos]

    save_status = @activity.save

    if save_status == true
      redirect_to("/activities/#{@activity.id}", :notice => "Activity created successfully.")
    else
      render("activities/new.html.erb")
    end
  end

  def edit
    @activity = Activity.find(params[:id])

    render("activities/edit.html.erb")
  end

  def update
    @activity = Activity.find(params[:id])

    @activity.name = params[:name]
    @activity.address = params[:address]
    @activity.visit_id = params[:visit_id]
    @activity.when_happened = params[:when_happened]
    @activity.review = params[:review]
    @activity.activity_rating = params[:activity_rating]
    @activity.recommend = params[:recommend]
    @activity.photos = params[:photos]

    save_status = @activity.save

    if save_status == true
      redirect_to("/activities/#{@activity.id}", :notice => "Activity updated successfully.")
    else
      render("activities/edit.html.erb")
    end
  end

  def destroy
    @activity = Activity.find(params[:id])

    @activity.destroy

    if URI(request.referer).path == "/activities/#{@activity.id}"
      redirect_to("/", :notice => "Activity deleted.")
    else
      redirect_to(:back, :notice => "Activity deleted.")
    end
  end
end
