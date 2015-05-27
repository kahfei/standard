class ChangeDecimalToFloatForCopperwire < ActiveRecord::Migration
  def change
  	change_column :copperwires, :diameter, :float
  end
end
