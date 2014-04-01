class RegionsController < ApplicationController
  def index
    @regions = Region.all
    render('regions/index.html.erb')
  end

  def show
    @region = Region.find(params[:id])
    render('regions/show.html.erb')
  end

  def new
    @region = Region.new
    render('regions/new.html.erb')
  end

  def create
    @region = Region.new(params[:region])

    if @region.save
      redirect_to regions_path
    else
      render('regions/new.html.erb')
    end
  end

  def edit
    @region = Region.find(params[:id])
    render('regions/edit.html.erb')
  end

  def destroy
    @region = Region.find(params[:id])
    @region.destroy
    redirect_to regions_path
  end

  def update
    @region = Region.find(params[:id])
    @region.update(params[:region])

    if @region.save
      redirect_to regions_path
    else
      render('regions/edit.html.erb')
    end
  end
end
