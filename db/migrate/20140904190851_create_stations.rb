class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :address
    end
  end
end
