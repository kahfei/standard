class CreateCarbonBrushImports < ActiveRecord::Migration
  def change
    create_table :carbon_brush_imports do |t|

      t.timestamps
    end
  end
end
