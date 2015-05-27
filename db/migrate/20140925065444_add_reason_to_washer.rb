class AddReasonToWasher < ActiveRecord::Migration
  def change
    add_column :washers, :reason, :string
  end
end
