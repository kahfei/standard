class CreateCopperwires < ActiveRecord::Migration
  def self.up
    create_table :copperwires do |t|
      t.string :partnumber
      t.string :description
      t.string :copperwire_type
      t.string :self_bonded
      t.decimal :diameter
      t.string :drawing_norm
      t.string :supplier
      t.string :where_used_product
      t.string :release_status
      t.string :uploaded_by_section
      t.string :uploader_role
      t.string :uploader_name
      t.boolean :need_to_edit_partnumber
      t.boolean :need_to_edit_description
      t.boolean :need_to_edit_copperwire_type
      t.boolean :need_to_edit_self_bonded
      t.boolean :need_to_edit_diameter
      t.boolean :need_to_edit_drawing_norm
      t.boolean :need_to_edit_supplier
      t.boolean :need_to_edit_where_used_product

      t.timestamps
    end
  end

  def self.down
    drop_table :copperwires
  end
end
