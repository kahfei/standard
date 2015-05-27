class AddWhereUsedPlantToModels < ActiveRecord::Migration
  def change
  	add_column :greases, :need_to_edit_where_used_plant, :boolean
  	add_column :plastic_materials, :need_to_edit_where_used_plant, :boolean
  	add_column :copperwires, :need_to_edit_where_used_plant, :boolean
  end
end
