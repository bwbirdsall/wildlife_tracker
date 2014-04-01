class SpeciesController < ApplicationController
  def index
    @species_all = Species.all
    render('species/index.html.erb')
  end

  def new
    @species = Species.new
    render('species/new.html.erb')
  end

  def create
    @species = Species.new(params[:species])

    if @species.save
      redirect_to action: :index
    else
      render('species/new.html.erb')
    end
  end

  def edit
    @species = Species.find(params[:id])
    render('species/edit.html.erb')
  end

  def destroy
    @species = Species.find(params[:id])
    @species.destroy
    redirect_to action: :index
  end

  def update
    @species = Species.find(params[:id])
    @species.update(params[:species])

    if @species.save
      redirect_to action: :index
    else
      render('species/edit.html.erb')
    end
  end
end
