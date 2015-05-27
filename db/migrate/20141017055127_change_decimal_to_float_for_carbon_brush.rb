class ChangeDecimalToFloatForCarbonBrush < ActiveRecord::Migration
  def change
  	change_column :carbon_brushes, :length, :float
  	change_column :carbon_brushes, :wire_length_or_spring_free_length, :float
  	change_column :carbon_brushes, :radius_for_commutator_mm, :float
  end
end
