class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.integer :org_id
      t.string :name
      t.string :description
      t.integer :location_id
      t.datetime :start_time
      t.integer :priority
      t.boolean :is_multi_day
      t.datetime :end_time
      t.integer :category_id
      t.boolean :is_active

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
