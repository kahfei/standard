class CreateGrommets < ActiveRecord::Migration
  def change
    create_table :grommets do |t|
      t.string :partnumber
      t.string :description
      t.string :inner_hole_diameter
      t.string :grommet_type
      t.string :length
      t.string :for_cord_od
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
      t.boolean :need_to_edit_inner_hole_diameter
      t.boolean :need_to_edit_grommet_type
      t.boolean :need_to_edit_length
      t.boolean :need_to_edit_for_cord_od
      t.boolean :need_to_edit_material
      t.boolean :need_to_edit_drawing_norm
      t.boolean :need_to_edit_where_used_product
      t.boolean :need_to_edit_where_used_plant
      t.boolean :need_to_edit_remark

      t.timestamps
    end
  end
end
