class RemoveLocationFromStations < ActiveRecord::Migration
  def change
    remove_column :stations, :location, :string
  end
end
