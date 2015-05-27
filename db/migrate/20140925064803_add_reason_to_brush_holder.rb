class AddReasonToBrushHolder < ActiveRecord::Migration
  def change
    add_column :brush_holders, :reason, :string
  end
end
