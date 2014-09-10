class AddColumnToStations < ActiveRecord::Migration
  def change
    add_column :stations, :updated_at, :datetime
  end
end
