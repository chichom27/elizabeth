class CreateOrganizations < ActiveRecord::Migration
  def self.up
    create_table :organizations do |t|
      t.string :name
      t.text :description
      t.integer :location_id
      t.string :website
      t.integer :category_id
      t.boolean :is_pending
      t.string :email
      t.string :phone
      t.string :cellphone
      t.string :fax
      t.string :username
      t.string :password
      t.string :user_type
      t.boolean :is_active

      t.timestamps
    end
  end

  def self.down
    drop_table :organizations
  end
end
