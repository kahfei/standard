class AddReasonToCopperwire < ActiveRecord::Migration
  def change
    add_column :copperwires, :reason, :string
  end
end
