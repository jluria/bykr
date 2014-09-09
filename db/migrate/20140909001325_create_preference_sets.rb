class CreatePreferenceSets < ActiveRecord::Migration
  def change
    create_table :preference_sets do |t|
      t.float :distance
      t.integer :bikes
      t.integer :free_docks
      t.references :user, index: true

      t.timestamps
    end
  end
end
