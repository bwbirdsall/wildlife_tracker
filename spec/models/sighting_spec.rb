require 'spec_helper'

describe Sighting do
  it { should validate_presence_of :species_id }
  it { should validate_presence_of :location }
  it { should validate_presence_of :name }
  it { should validate_presence_of :datetime }
  it { should validate_presence_of :region_id }
  it { should belong_to :region }
  it { should belong_to :species }

  context '.list_sightings' do
    it 'should list sightings for a given species' do
      test_species = Species.create(:name => "bat")
      test_sighting1 = Sighting.create(:name => "bob", :species_id => test_species.id, :region_id => 2, :datetime => '2012/12/12 12:12:12', :location => 'the sun')
      test_sighting2 = Sighting.create(:name => "george", :species_id => test_species.id, :region_id => 2,  :datetime => '2012/12/12 12:12:12', :location => 'the moon')
      Sighting.list_sightings(test_species.id).should eq [test_sighting1, test_sighting2]
    end
  end
end
