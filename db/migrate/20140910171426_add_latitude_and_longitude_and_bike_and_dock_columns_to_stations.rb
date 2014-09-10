class AddLatitudeAndLongitudeAndBikeAndDockColumnsToStations < ActiveRecord::Migration
  def change
    add_column :stations, :latitude, :float
    add_column :stations, :longitude, :float
    add_column :stations, :bikes, :integer
    add_column :stations, :free_docks, :integer
  end
end
