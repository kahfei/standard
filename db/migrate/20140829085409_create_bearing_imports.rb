class CreateBearingImports < ActiveRecord::Migration
  def change
    create_table :bearing_imports do |t|

      t.timestamps
    end
  end
end
