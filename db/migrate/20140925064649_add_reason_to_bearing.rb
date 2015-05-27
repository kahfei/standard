class AddReasonToBearing < ActiveRecord::Migration
  def change
    add_column :bearings, :reason, :string
  end
end
