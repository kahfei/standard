class CreateCarbonBrushes < ActiveRecord::Migration
  def change
    create_table :carbon_brushes do |t|
      t.string :partnumber
      t.string :description
      t.string :components
      t.string :cross_sec
      t.decimal :length
      t.decimal :wire_length_or_spring_free_length
      t.decimal :radius_for_commutator_mm
      t.string :cut_off
      t.string :supplier
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
      t.boolean :need_to_edit_components
      t.boolean :need_to_edit_cross_sec
      t.boolean :need_to_edit_length
      t.boolean :need_to_edit_wire_length_or_spring_free_length
      t.boolean :need_to_edit_radius_for_commutator_mm
      t.boolean :need_to_edit_cut_off
      t.boolean :need_to_edit_supplier
      t.boolean :need_to_edit_drawing_norm
      t.boolean :need_to_edit_where_used_product
      t.boolean :need_to_edit_where_used_plant
      t.boolean :need_to_edit_remark

      t.timestamps
    end
  end
end
