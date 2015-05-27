class AddScaleToNumberFields < ActiveRecord::Migration
  def change
  	change_column :spiral_springs, :material_width, :float, :scale => 3
  	change_column :spiral_springs, :outer_dia, :float, :scale => 3
  	change_column :spiral_springs, :material_thickness, :float, :scale => 3
  	change_column :spiral_springs, :torsion_arm_length, :float, :scale => 3
  	change_column :spiral_springs, :torsion_arm_movable_distance, :float, :scale => 3
  	change_column :spiral_springs, :initial_force, :float, :scale => 3
  	change_column :spiral_springs, :final_force, :float, :scale => 3
  	change_column :bearings, :i_dia, :float, :scale => 3
  	change_column :bearings, :o_dia, :float, :scale => 3
  	change_column :bearings, :width, :float, :scale => 3
  	change_column :c_clips, :norminal_diameter, :float, :scale => 3
  	change_column :c_clips, :thickness, :float, :scale => 3
  	change_column :carbon_brushes, :length, :float, :scale => 3
  	change_column :carbon_brushes, :wire_length_or_spring_free_length, :float, :scale => 3
  	change_column :carbon_brushes, :radius_for_commutator_mm, :float, :scale => 3
  	change_column :copperwires, :diameter, :float, :scale => 3
  	change_column :cord_clips, :max_cord_od, :float, :scale => 3
  	change_column :screws, :length, :float, :scale => 3
  	change_column :springs, :material_dia, :float, :scale => 3
  	change_column :springs, :mean_dia, :float, :scale => 3
  	change_column :springs, :free_length, :float, :scale => 3
  	change_column :springs, :no_of_active_coils, :float, :scale => 3
  	change_column :springs, :solid_length_max, :float, :scale => 3
  	change_column :springs, :dimension_f1, :float, :scale => 3
  	change_column :springs, :dimension_l1, :float, :scale => 3
  	change_column :springs, :dimension_f2, :float, :scale => 3
  	change_column :springs, :dimension_l2, :float, :scale => 3
  	change_column :springs, :initial_load_nm, :float, :scale => 3
  	change_column :springs, :final_load_nm, :float, :scale => 3
  	change_column :springs, :torque_arm_length, :float, :scale => 3
  	change_column :springs, :hook_length, :float, :scale => 3
  	change_column :springs, :hook_arc_radius, :float, :scale => 3
  	change_column :springs, :spring_constant, :float, :scale => 3
  	change_column :washers, :inner_diameter, :float, :scale => 3
  	change_column :washers, :outer_diameter, :float, :scale => 3
  	change_column :washers, :thickness, :float, :scale => 3
  end
end
