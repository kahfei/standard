class AddUploaderNameToGrease < ActiveRecord::Migration
  def self.up
    add_column :greases, :uploader_name, :string
  end

  def self.down
    remove_column :greases, :uploader_name
  end
end
