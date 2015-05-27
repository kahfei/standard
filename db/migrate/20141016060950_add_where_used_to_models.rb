class AddWhereUsedToModels < ActiveRecord::Migration
  def change
  	add_column :greases, :where_used_plant, :string
  	add_column :plastic_materials, :where_used_plant, :string
  	add_column :copperwires,:where_used_plant, :string
  end
end
