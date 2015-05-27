class ChangeOuterDiaToFloat < ActiveRecord::Migration
  def change
    change_column :spiral_springs, :outer_dia, :float
  end
end
