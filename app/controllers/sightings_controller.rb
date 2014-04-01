class SightingsController < ApplicationController
  def index
    @sightings = Sighting.between(params[:sightings])
    render('sightings/index.html.erb')
  end

  def new
    @sighting = Sighting.new
    render('sightings/new.html.erb')
  end

  def create
    @sighting = Sighting.new(params[:sighting])

    if @sighting.save
      render('sightings/success.html.erb')
    else
      render('sightings/new.html.erb')
    end
  end

  def edit
    @sighting = Sighting.find(params[:id])
    render('sightings/edit.html.erb')
  end

  def destroy
    @sighting = Sighting.find(params[:id])
    @sighting.destroy
    redirect_to :back
  end

  def update
    @sighting = Sighting.find(params[:id])
    @sighting.update(params[:sighting])

    if @sighting.save
      redirect_to action: :index
    else
      render('sightings/edit.html.erb')
    end
  end
end
