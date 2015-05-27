class CreateCords < ActiveRecord::Migration
  def change
    create_table :cords do |t|
      t.string :partnumber
      t.string :description
      t.string :cord_mat
      t.string :cord_type
      t.string :plug_type
      t.string :polarity
      t.string :cross_sec
      t.string :cord_od
      t.string :length
      t.string :dismantled_length
      t.string :switch_con
      t.string :drawing_norm
      t.string :where_used_product
      t.string :where_used_plant
      t.string :cord_spec
      t.string :remark
      t.string :release_status
      t.string :uploaded_by_section
      t.string :uploader_role
      t.string :uploader_name
      t.boolean :need_to_edit_partnumber
      t.boolean :need_to_edit_description
      t.boolean :need_to_edit_cord_mat
      t.boolean :need_to_edit_cord_type
      t.boolean :need_to_edit_plug_type
      t.boolean :need_to_edit_polarity
      t.boolean :need_to_edit_cross_sec
      t.boolean :need_to_edit_cord_od
      t.boolean :need_to_edit_length
      t.boolean :need_to_edit_dismantled_length
      t.boolean :need_to_edit_switch_con
      t.boolean :need_to_edit_drawing_norm
      t.boolean :need_to_edit_where_used_product
      t.boolean :need_to_edit_where_used_plant
      t.boolean :need_to_edit_cord_spec
      t.boolean :need_to_edit_remark

      t.timestamps
    end
  end
end
