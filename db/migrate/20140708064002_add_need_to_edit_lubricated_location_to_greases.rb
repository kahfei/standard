class AddNeedToEditLubricatedLocationToGreases < ActiveRecord::Migration
  def self.up
    add_column :greases, :need_to_edit_lubricated_location, :boolean
  end

  def self.down
    remove_column :greases, :need_to_edit_lubricated_location
  end
end
