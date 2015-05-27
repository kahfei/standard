class FixWasherFields < ActiveRecord::Migration
  def change
  	add_column :washers, :hardness, :string
  	add_column :washers, :original_plant, :string
	add_column :washers, :need_to_edit_hardness, :boolean
  	add_column :washers, :need_to_edit_original_plant, :boolean
  	rename_column :washers, :drawing_norm, :drawing_number
  	rename_column :washers, :need_to_edit_drawing_norm, :need_to_edit_drawing_number
  	add_column :nuts, :need_to_edit_material, :boolean
  	rename_column :nuts, :need_to_edit_drawing_norm, :need_to_edit_drawing_number 
  end
end
