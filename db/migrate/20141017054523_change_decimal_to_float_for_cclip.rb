class ChangeDecimalToFloatForCclip < ActiveRecord::Migration
  def change
  	change_column :c_clips, :norminal_diameter, :float
  	change_column :c_clips, :thickness, :float
  end
end
