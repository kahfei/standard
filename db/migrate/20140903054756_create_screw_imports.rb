class CreateScrewImports < ActiveRecord::Migration
  def change
    create_table :screw_imports do |t|

      t.timestamps
    end
  end
end
