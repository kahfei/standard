class AddWhereUsedPlantToConnector < ActiveRecord::Migration
  def change
  	add_column :connectors, :where_used_plant, :string
  end
end
