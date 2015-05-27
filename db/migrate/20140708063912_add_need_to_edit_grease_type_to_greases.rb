class AddNeedToEditGreaseTypeToGreases < ActiveRecord::Migration
  def self.up
    add_column :greases, :need_to_edit_grease_type, :boolean
  end

  def self.down
    remove_column :greases, :need_to_edit_grease_type
  end
end
