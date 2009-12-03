class AddAlbumIdToOrganization < ActiveRecord::Migration
  def self.up
    add_column :organizations, :album_id, :integer
  end

  def self.down
    remove_column :organizations, :album_id
  end
end
