class Changematerialwidthtodecimal < ActiveRecord::Migration
  def change
  	change_column :spiral_springs, :material_width, :decimal
  end
end
  