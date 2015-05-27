class CreateConnectorImports < ActiveRecord::Migration
  def change
    create_table :connector_imports do |t|

      t.timestamps
    end
  end
end
