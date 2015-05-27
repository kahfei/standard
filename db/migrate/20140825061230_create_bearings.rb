class CreateBearings < ActiveRecord::Migration
  def self.up
    create_table :bearings do |t|
      t.string :partnumber
      t.string :description
      t.decimal :i_dia
      t.decimal :o_dia
      t.decimal :width
      t.string :bearing_type
      t.string :bearing_no
      t.string :radial_clearance_um
      t.string :sealing
      t.integer :max_speed_rpm
      t.string :position_within_product
      t.string :drawing_norm
      t.string :where_used_product
      t.string :where_used_plant
      t.string :supplier
      t.string :remark
      t.string :release_status
      t.string :uploaded_by_section
      t.string :uploader_role
      t.string :uploader_name
      t.boolean :need_to_edit_partnumber
      t.boolean :need_to_edit_description
      t.boolean :need_to_edit_i_dia
      t.boolean :need_to_edit_o_dia
      t.boolean :need_to_edit_width
      t.boolean :need_to_edit_bearing_type
      t.boolean :need_to_edit_bearing_no
      t.boolean :need_to_edit_radial_clearance_um
      t.boolean :need_to_edit_sealing
      t.boolean :need_to_edit_max_speed_rpm
      t.boolean :need_to_edit_position_within_product
      t.boolean :need_to_edit_drawing_norm
      t.boolean :need_to_edit_where_used_product
      t.boolean :need_to_edit_where_used_plant
      t.boolean :need_to_edit_supplier
      t.boolean :need_to_edit_remark

      t.timestamps
    end
  end

  def self.down
    drop_table :bearings
  end
end
