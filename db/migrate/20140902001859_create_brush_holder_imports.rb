class CreateBrushHolderImports < ActiveRecord::Migration
  def change
    create_table :brush_holder_imports do |t|

      t.timestamps
    end
  end
end
