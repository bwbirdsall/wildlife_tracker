class ChangeTimeType < ActiveRecord::Migration
  def change
    remove_column :sightings, :date
    remove_column :sightings, :time
    add_column :sightings, :datetime, :datetime
  end
end
