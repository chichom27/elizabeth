class AddOrgIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :org_id, :integer
  end

  def self.down
    remove_column :users, :org_id
  end
end
