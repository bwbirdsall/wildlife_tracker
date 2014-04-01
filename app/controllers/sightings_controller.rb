class SightingsController < ApplicationController
  def index
    @sighting = Sighting.new
    render('sightings/index.html.erb')
  end

  def create
    @sighting = Sighting.new(params[:sighting])

    if @sighting.save
      render('sightings/success.html.erb')
    else
      render('sightings/index.html.erb')
    end
  end

  def list_all
    @sightings = Sighting.all
    render('sightings/list.html.erb')
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
      redirect_to action: :list_all
    else
      render('sightings/edit.html.erb')
    end
  end
end
