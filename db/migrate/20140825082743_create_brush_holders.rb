class CreateBrushHolders < ActiveRecord::Migration
  def self.up
    create_table :brush_holders do |t|
      t.string :partnumber
      t.string :description
      t.string :brush_holder_type
      t.string :material
      t.string :drawing_norm
      t.string :corresponding_carbon_brush
      t.string :supplier
      t.string :where_used_product
      t.string :where_used_plant
      t.string :release_status
      t.string :uploaded_by_section
      t.string :uploader_role
      t.string :uploader_name
      t.boolean :need_to_edit_partnumber
      t.boolean :need_to_edit_description
      t.boolean :need_to_edit_brush_holder_type
      t.boolean :need_to_edit_material
      t.boolean :need_to_edit_drawing_norm
      t.boolean :need_to_edit_corresponding_carbon_brush
      t.boolean :need_to_edit_supplier
      t.boolean :need_to_edit_where_used_product
      t.boolean :need_to_edit_where_used_plant

      t.timestamps
    end
  end

  def self.down
    drop_table :brush_holders
  end
end
