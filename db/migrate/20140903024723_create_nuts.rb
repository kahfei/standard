class CreateNuts < ActiveRecord::Migration
  def change
    create_table :nuts do |t|
      t.string :partnumber
      t.string :description
      t.string :nut_type
      t.string :nut_size
      t.decimal :width
      t.string :drawing_norm
      t.string :coating
      t.string :where_used_product
      t.string :where_used_plant
      t.string :remark
      t.string :release_status
      t.string :uploaded_by_section
      t.string :uploader_role
      t.string :uploader_name
      t.boolean :need_to_edit_partnumber
      t.boolean :need_to_edit_description
      t.boolean :need_to_edit_nut_type
      t.boolean :need_to_edit_nut_size
      t.boolean :need_to_edit_width
      t.boolean :need_to_edit_drawing_norm
      t.boolean :need_to_edit_coating
      t.boolean :need_to_edit_where_used_product
      t.boolean :need_to_edit_where_used_plant
      t.boolean :need_to_edit_remark

      t.timestamps
    end
  end
end
