require 'spec_helper'

describe Sighting do
  it { should validate_presence_of :species_id }
  it { should validate_presence_of :location }
  it { should validate_presence_of :name }
  it { should validate_presence_of :datetime }
  it { should validate_presence_of :region_id }
  it { should belong_to :region }
  it { should belong_to :species }

  context '.list_species_sightings' do
    it 'should list sightings for a given species' do
      test_species = Species.create(:name => "bat")
      test_sighting1 = Sighting.create(:name => "bob", :species_id => test_species.id, :region_id => 2, :datetime => '2012/12/12 12:12:12', :location => 'the sun')
      test_sighting2 = Sighting.create(:name => "george", :species_id => test_species.id, :region_id => 2,  :datetime => '2012/12/12 12:12:12', :location => 'the moon')
      Sighting.list_species_sightings(test_species.id).should eq [test_sighting1, test_sighting2]
    end
  end

  context '.list_region_sightings' do
    it 'should list sightings for a given region' do
      test_species = Species.create(:name => "bat")
      test_region = Region.create(:name => "north")
      test_sighting1 = Sighting.create(:name => "bob", :species_id => test_species.id, :region_id => test_region.id, :datetime => '2012/12/12 12:12:12', :location => 'the sun')
      test_sighting2 = Sighting.create(:name => "george", :species_id => test_species.id, :region_id => 1,  :datetime => '2012/12/12 12:12:12', :location => 'the moon')
      test_sighting3 = Sighting.create(:name => "bob", :species_id => test_species.id, :region_id => test_region.id, :datetime => '2012/12/12 12:12:12', :location => 'the sun')
      Sighting.list_region_sightings(test_region.id).should eq [test_sighting1, test_sighting3]
    end
  end

  context '.between' do
    it 'should list sightings for a given date range' do
      test_species = Species.create(:name => "bat")
      test_sighting1 = Sighting.create(:name => "bob", :species_id => test_species.id, :region_id => 2, :datetime => '2013/11/12 12:12:12', :location => 'the sun')
      test_sighting2 = Sighting.create(:name => "george", :species_id => test_species.id, :region_id => 2,  :datetime => '2012/10/12 12:12:12', :location => 'the moon')
      test_sighting3 = Sighting.create(:name => "george", :species_id => test_species.id, :region_id => 2,  :datetime => '2015/12/12 12:12:12', :location => 'the moon')
      date_hash = {:start_date => test_sighting1.datetime, :end_date => test_sighting3.datetime}
      Sighting.between(date_hash).should eq [test_sighting1, test_sighting3]
    end
    it 'should list all sightings if no date range is given' do
      test_species = Species.create(:name => "bat")
      test_sighting1 = Sighting.create(:name => "bob", :species_id => test_species.id, :region_id => 2, :datetime => '2013/11/12 12:12:12', :location => 'the sun')
      test_sighting2 = Sighting.create(:name => "george", :species_id => test_species.id, :region_id => 2,  :datetime => '2012/10/12 12:12:12', :location => 'the moon')
      test_sighting3 = Sighting.create(:name => "george", :species_id => test_species.id, :region_id => 2,  :datetime => '2015/12/12 12:12:12', :location => 'the moon')
      date_hash = nil
      Sighting.between(date_hash).should eq [test_sighting1, test_sighting2, test_sighting3]
    end
  end
end
