class CreateWasherImports < ActiveRecord::Migration
  def change
    create_table :washer_imports do |t|

      t.timestamps
    end
  end
end
