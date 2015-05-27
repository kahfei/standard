class CreatePlasticMaterials < ActiveRecord::Migration
  def change
    create_table :plastic_materials do |t|
      t.string :partnumber
      t.string :resin
      t.string :color
      t.string :supplier
      t.string :recommendation
      t.string :ul_number
      t.string :drawing_norm
      t.string :where_used_product
      t.string :supplier_material_info
      t.string :related_molders
      t.string :release_status
      t.string :uploaded_by_section
      t.string :uploader_role
      t.string :uploader_name
      t.boolean :need_to_edit_partnumber
      t.boolean :need_to_edit_resin
      t.boolean :need_to_edit_color
      t.boolean :need_to_edit_supplier
      t.boolean :need_to_edit_recommendation
      t.boolean :need_to_edit_ul_number
      t.boolean :need_to_edit_drawing_norm
      t.boolean :need_to_edit_where_used_product
      t.boolean :need_to_edit_supplier_material_info
      t.boolean :need_to_edit_related_molders

      t.timestamps
    end
  end
end
