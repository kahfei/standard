class AddReasonToSpiralSpring < ActiveRecord::Migration
  def change
    add_column :spiral_springs, :reason, :string
  end
end
