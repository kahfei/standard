class AddUploaderRoleToGrease < ActiveRecord::Migration
  def self.up
    add_column :greases, :uploader_role, :string
  end

  def self.down
    remove_column :greases, :uploader_role
  end
end
