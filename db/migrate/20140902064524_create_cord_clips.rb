class CreateCordClips < ActiveRecord::Migration
  def change
    create_table :cord_clips do |t|
      t.string :partnumber
      t.string :description
      t.string :cord_clip_type
      t.string :material
      t.decimal :max_cord_od
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
      t.boolean :need_to_edit_cord_clip_type
      t.boolean :need_to_edit_material
      t.boolean :need_to_edit_max_cord_od
      t.boolean :need_to_edit_drawing_norm
      t.boolean :need_to_edit_where_used_product
      t.boolean :need_to_edit_where_used_plant
      t.boolean :need_to_edit_remark

      t.timestamps
    end
  end
end
