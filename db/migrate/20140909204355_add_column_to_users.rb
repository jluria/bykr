class AddColumnToUsers < ActiveRecord::Migration
  def change
     add_column :users, :max_distance_to_station, :float
     add_column :users, :min_bikes_at_station, :integer
     add_column :users, :min_free_bike_docks, :integer
  end
end
