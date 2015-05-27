class Changematerialwidthtofloat < ActiveRecord::Migration
  def change
  	change_column :spiral_springs, :material_width, :float
  end
end
