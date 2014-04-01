class CreateSpeciesAndSightingTables < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.column :species_id, :integer
      t.column :time, :time
      t.column :date, :date
      t.column :location, :string
      t.column :region_id, :integer
      t.column :name, :string

      t.timestamps
    end

    create_table :species do |t|
      t.column :name, :string
    end
  end
end
