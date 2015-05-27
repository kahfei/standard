class CreateSpiralSprings < ActiveRecord::Migration
  def change
    create_table :spiral_springs do |t|
      t.string :partnumber
      t.string :description
      t.decimal :material_thickness
      t.decimal :material_width
      t.decimal :outer_dia
      t.decimal :torsion_arm_length
      t.decimal :torsion_arm_movable_distance
      t.decimal :initial_force
      t.decimal :final_force
      t.string :supplier
      t.string :drawing_norm
      t.string :where_used_product
      t.string :where_used_plant
      t.string :release_status
      t.string :uploaded_by_section
      t.string :uploader_role
      t.string :uploader_name
      t.boolean :need_to_edit_partnumber
      t.boolean :need_to_edit_description
      t.boolean :need_to_edit_material_thickness
      t.boolean :need_to_edit_material_width
      t.boolean :need_to_edit_outer_dia
      t.boolean :need_to_edit_torsion_arm_length
      t.boolean :need_to_edit_torsion_arm_movable_distance
      t.boolean :need_to_edit_initial_force
      t.boolean :need_to_edit_final_force
      t.boolean :need_to_edit_supplier
      t.boolean :need_to_edit_drawing_norm
      t.boolean :need_to_edit_where_used_product
      t.boolean :need_to_edit_where_used_plant

      t.timestamps
    end
  end
end
