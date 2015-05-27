class CreateGrommetImports < ActiveRecord::Migration
  def change
    create_table :grommet_imports do |t|

      t.timestamps
    end
  end
end
