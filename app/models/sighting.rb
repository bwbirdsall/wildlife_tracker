class Sighting < ActiveRecord::Base
  validates :name, :presence => true
  validates :time, :presence => true
  validates :date, :presence => true
  validates :location, :presence => true
  validates :species_id, :presence => true
end
