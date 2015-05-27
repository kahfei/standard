class ChangeDecimalToFloatForBearing < ActiveRecord::Migration
  def change
  	change_column :bearings, :i_dia, :float
  	change_column :bearings, :o_dia, :float
  	change_column :bearings, :width, :float
  end
end
