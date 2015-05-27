class FixNutTable < ActiveRecord::Migration
  def change
  	add_column :nuts, :material, :string
  	rename_column :nuts, :drawing_norm, :drawing_number 
  end
end
