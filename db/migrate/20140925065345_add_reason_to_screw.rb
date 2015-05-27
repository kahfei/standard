class AddReasonToScrew < ActiveRecord::Migration
  def change
    add_column :screws, :reason, :string
  end
end
