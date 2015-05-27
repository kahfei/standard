class ChangeFieldsToFloatInSpiralSpring < ActiveRecord::Migration
  def change
  	change_column :spiral_springs, :material_thickness, :float
  	change_column :spiral_springs, :torsion_arm_length, :float
  	change_column :spiral_springs, :torsion_arm_movable_distance, :float
  	change_column :spiral_springs, :initial_force, :float
  	change_column :spiral_springs, :final_force, :float
  end
end
