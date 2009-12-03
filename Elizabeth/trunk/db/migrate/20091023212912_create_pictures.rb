class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.integer :org_id
      t.integer :event_id
      t.string :picture_path
      t.text :description
      t.boolean :is_active

      t.timestamps
    end
  end

  def self.down
    drop_table :pictures
  end
end
