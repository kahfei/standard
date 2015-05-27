class AddNeedToEditDescriptionToGreases < ActiveRecord::Migration
  def self.up
    add_column :greases, :need_to_edit_description, :boolean
  end

  def self.down
    remove_column :greases, :need_to_edit_description
  end
end
