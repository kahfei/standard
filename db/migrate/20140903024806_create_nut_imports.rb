class CreateNutImports < ActiveRecord::Migration
  def change
    create_table :nut_imports do |t|

      t.timestamps
    end
  end
end
