class AddReasonToConnector < ActiveRecord::Migration
  def change
    add_column :connectors, :reason, :string
  end
end
