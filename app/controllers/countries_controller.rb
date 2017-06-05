class CountriesController < ApplicationController
  def index

    @q = Country.ransack(params[:q])
    @countries = @q.result

    render("countries/index.html.erb")
  end

  def show
    @country = Country.find(params[:id])


    render("countries/show.html.erb")
  end

  def new
    @country = Country.new

    render("countries/new.html.erb")
  end

  def create
    @country = Country.new

    @country.name = params[:name]

    save_status = @country.save

    if save_status == true
      redirect_to("/countries/#{@country.id}", :notice => "Country created successfully.")
    else
      render("countries/new.html.erb")
    end
  end

  def edit
    @country = Country.find(params[:id])

    render("countries/edit.html.erb")
  end

  def update
    @country = Country.find(params[:id])

    @country.name = params[:name]

    save_status = @country.save

    if save_status == true
      redirect_to("/countries/#{@country.id}", :notice => "Country updated successfully.")
    else
      render("countries/edit.html.erb")
    end
  end

  def destroy
    @country = Country.find(params[:id])

    @country.destroy

    if URI(request.referer).path == "/countries/#{@country.id}"
      redirect_to("/", :notice => "Country deleted.")
    else
      redirect_to(:back, :notice => "Country deleted.")
    end
  end
end
