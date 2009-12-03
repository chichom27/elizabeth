class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.integer :org_id
      t.integer :pic_id
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.float :x_co
      t.float :y_co
      t.boolean :is_active

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
