class AddReasonToGrommet < ActiveRecord::Migration
  def change
    add_column :grommets, :reason, :string
  end
end
