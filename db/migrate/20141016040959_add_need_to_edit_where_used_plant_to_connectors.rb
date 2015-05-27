class AddNeedToEditWhereUsedPlantToConnectors < ActiveRecord::Migration
  def change
  	add_column :connectors, :need_to_edit_where_used_plant, :boolean
  end
end
