class ChangeDecimalToFloatForWasher < ActiveRecord::Migration
  def change
  	  change_column :washers, :inner_diameter, :float
  	  change_column :washers, :outer_diameter, :float
  	  change_column :washers, :thickness, :float
  end
end

