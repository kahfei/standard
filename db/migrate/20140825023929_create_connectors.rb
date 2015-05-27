class CreateConnectors < ActiveRecord::Migration
  def self.up
    create_table :connectors do |t|
      t.string :partnumber
      t.string :description
      t.string :connector_type
      t.string :drawing_norm
      t.string :h_x_w
      t.string :supplier
      t.string :where_used_product
      t.string :release_status
      t.string :uploaded_by_section
      t.string :uploader_role
      t.string :uploader_name
      t.boolean :need_to_edit_partnumber
      t.boolean :need_to_edit_description
      t.boolean :need_to_edit_connector_type
      t.boolean :need_to_edit_drawing_norm
      t.boolean :need_to_edit_h_x_w
      t.boolean :need_to_edit_supplier
      t.boolean :need_to_edit_where_used_product

      t.timestamps
    end
  end

  def self.down
    drop_table :connectors
  end
end
