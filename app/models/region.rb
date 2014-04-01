class Region < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  has_many :sightings
end
