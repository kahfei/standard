class ChangeDecimalToFloatForScrew < ActiveRecord::Migration
  def change
  	change_column :screws, :length, :float
  end
end
