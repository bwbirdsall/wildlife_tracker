class Sighting < ActiveRecord::Base
  belongs_to :species
  belongs_to :region
  validates :name, :presence => true
  validates :location, :presence => true
  validates :species_id, :presence => true
  validates :datetime, :presence => true
  validates :region_id, :presence => true

  def self.list_species_sightings(species_id)
    sightings = Sighting.where(:species_id => species_id)
  end

  def self.list_region_sightings(region_id)
    sightings = Sighting.where(:region_id => region_id)
  end

  def self.between(dates)
    if dates.nil? || dates[:start_date].nil? || dates[:end_date].nil? || dates[:start_date] == "" || dates[:end_date] == ""
      sightings = Sighting.all
    else
      sightings = Sighting.where(datetime: dates[:start_date]..dates[:end_date])
    end
    sightings
  end
end
