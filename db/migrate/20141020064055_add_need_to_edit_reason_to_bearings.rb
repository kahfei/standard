class AddNeedToEditReasonToBearings < ActiveRecord::Migration
  def change
  	add_column :bearings, :need_to_edit_reason, :boolean
  end
end
