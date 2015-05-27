class AddReasonToCord < ActiveRecord::Migration
  def change
    add_column :cords, :reason, :string
  end
end
