class AddNeedToEditReason < ActiveRecord::Migration
  def change
  	add_column :brush_holders, :need_to_edit_reason, :boolean
  	add_column :c_clips, :need_to_edit_reason, :boolean
  	add_column :capacitors, :need_to_edit_reason, :boolean
  	add_column :carbon_brushes, :need_to_edit_reason, :boolean
  	add_column :connectors, :need_to_edit_reason, :boolean
  	add_column :copperwires, :need_to_edit_reason, :boolean
  	add_column :cord_clips, :need_to_edit_reason, :boolean
  	add_column :cords, :need_to_edit_reason, :boolean
  	add_column :greases, :need_to_edit_reason, :boolean
  	add_column :grommets, :need_to_edit_reason, :boolean
  	add_column :nuts, :need_to_edit_reason, :boolean
  	add_column :plastic_materials, :need_to_edit_reason, :boolean
  	add_column :screws, :need_to_edit_reason, :boolean
  	add_column :spiral_springs, :need_to_edit_reason, :boolean
  	add_column :springs, :need_to_edit_reason, :boolean
  	add_column :washers, :need_to_edit_reason, :boolean
  	
  end
end
