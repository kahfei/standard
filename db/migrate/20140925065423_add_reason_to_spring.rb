class AddReasonToSpring < ActiveRecord::Migration
  def change
    add_column :springs, :reason, :string
  end
end
