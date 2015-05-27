class CreateWashers < ActiveRecord::Migration
  def change
    create_table :washers do |t|
      t.string :partnumber
      t.string :description
      t.string :washer_type
      t.decimal :inner_diameter
      t.decimal :outer_diameter
      t.decimal :thickness
      t.string :coating
      t.string :material
      t.string :drawing_norm
      t.string :where_used_product
      t.string :where_used_plant
      t.string :remark
      t.string :release_status
      t.string :uploaded_by_section
      t.string :uploader_role
      t.string :uploader_name
      t.boolean :need_to_edit_partnumber
      t.boolean :need_to_edit_description
      t.boolean :need_to_edit_washer_type
      t.boolean :need_to_edit_inner_diameter
      t.boolean :need_to_edit_outer_diameter
      t.boolean :need_to_edit_thickness
      t.boolean :need_to_edit_coating
      t.boolean :need_to_edit_material
      t.boolean :need_to_edit_drawing_norm
      t.boolean :need_to_edit_where_used_product
      t.boolean :need_to_edit_where_used_plant
      t.boolean :need_to_edit_remark

      t.timestamps
    end
  end
end
