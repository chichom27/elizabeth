class UpdateEvents < ActiveRecord::Migration
  def self.up
    drop_table :events
    create_table :events do |t|
      t.integer :org_id
      t.string :name
      t.string :description
      t.integer :location_id
      t.datetime :start_at
      t.datetime :end_at
      t.integer :priority
      t.boolean :is_multi_day
      t.integer :category_id
      t.boolean :is_active

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
