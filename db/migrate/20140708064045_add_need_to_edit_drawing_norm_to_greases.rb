class AddNeedToEditDrawingNormToGreases < ActiveRecord::Migration
  def self.up
    add_column :greases, :need_to_edit_drawing_norm, :boolean
  end

  def self.down
    remove_column :greases, :need_to_edit_drawing_norm
  end
end
