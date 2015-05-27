class ChangeDecimalToFloatForSpring < ActiveRecord::Migration
  def change
  	change_column :springs, :material_dia, :float
  	change_column :springs, :mean_dia, :float
  	change_column :springs, :free_length, :float
  	change_column :springs, :no_of_active_coils, :float
  	change_column :springs, :solid_length_max, :float
  	change_column :springs, :dimension_f1, :float
  	change_column :springs, :dimension_l1, :float
  	change_column :springs, :dimension_f2, :float
  	change_column :springs, :dimension_l2, :float
  	change_column :springs, :initial_load_nm, :float
  	change_column :springs, :final_load_nm, :float
  	change_column :springs, :torque_arm_length, :float
  	change_column :springs, :hook_length, :float
  	change_column :springs, :hook_arc_radius, :float
  	change_column :springs, :spring_constant, :float
  end
end