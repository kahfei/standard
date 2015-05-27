class ChangeDecimalToFloatForCordClip < ActiveRecord::Migration
  def change
  	change_column :cord_clips, :max_cord_od, :float
  end
end
