class AddReasonToNut < ActiveRecord::Migration
  def change
    add_column :nuts, :reason, :string
  end
end
