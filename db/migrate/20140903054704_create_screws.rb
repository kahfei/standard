class CreateScrews < ActiveRecord::Migration
  def change
    create_table :screws do |t|
      t.string :partnumber
      t.string :description
      t.string :screw_drive
      t.string :screw_head
      t.string :thread_type
      t.string :screw_size
      t.decimal :length
      t.string :connection_material
      t.string :coating
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
      t.boolean :need_to_edit_screw_drive
      t.boolean :need_to_edit_screw_head
      t.boolean :need_to_edit_thread_type
      t.boolean :need_to_edit_screw_size
      t.boolean :need_to_edit_length
      t.boolean :need_to_edit_connection_material
      t.boolean :need_to_edit_coating
      t.boolean :need_to_edit_drawing_norm
      t.boolean :need_to_edit_where_used_product
      t.boolean :need_to_edit_where_used_plant
      t.boolean :need_to_edit_remark

      t.timestamps
    end
  end
end
