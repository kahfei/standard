class ChangeMaterialWidthInSpiralSprings < ActiveRecord::Migration
  def change
  	change_column :spiral_springs, :material_width, :integer
  end
end
