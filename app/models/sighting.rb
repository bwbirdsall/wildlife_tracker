class Sighting < ActiveRecord::Base
  belongs_to :species
  belongs_to :region
  validates :name, :presence => true
  validates :location, :presence => true
  validates :species_id, :presence => true
  validates :datetime, :presence => true
  validates :region_id, :presence => true

  def self.between(dates)
    if dates.nil? || dates[:start_date] == "" || dates[:end_date] == ""
      sightings = Sighting.all
    else
      sightings = Sighting.where(datetime: dates[:start_date]..dates[:end_date])
    end
    sightings
  end
end
