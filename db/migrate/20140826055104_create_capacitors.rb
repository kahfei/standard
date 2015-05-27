class CreateCapacitors < ActiveRecord::Migration
  def self.up
    create_table :capacitors do |t|
      t.string :partnumber
      t.string :description
      t.string :capacitor_type
      t.string :capacity
      t.string :feet
      t.string :capacitor_class
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
      t.boolean :need_to_edit_capacitor_type
      t.boolean :need_to_edit_capacity
      t.boolean :need_to_edit_feet
      t.boolean :need_to_edit_capacitor_class
      t.boolean :need_to_edit_drawing_norm
      t.boolean :need_to_edit_where_used_product
      t.boolean :need_to_edit_where_used_plant
      t.boolean :need_to_edit_remark

      t.timestamps
    end
  end

  def self.down
    drop_table :capacitors
  end
end
