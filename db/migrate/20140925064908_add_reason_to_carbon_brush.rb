class AddReasonToCarbonBrush < ActiveRecord::Migration
  def change
    add_column :carbon_brushes, :reason, :string
  end
end
