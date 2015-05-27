class CreateCordImports < ActiveRecord::Migration
  def change
    create_table :cord_imports do |t|

      t.timestamps
    end
  end
end
