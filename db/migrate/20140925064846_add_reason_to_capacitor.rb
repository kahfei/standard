class AddReasonToCapacitor < ActiveRecord::Migration
  def change
    add_column :capacitors, :reason, :string
  end
end
