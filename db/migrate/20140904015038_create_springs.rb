class CreateSprings < ActiveRecord::Migration
  def change
    create_table :springs do |t|
      t.string :partnumber
      t.string :description
      t.string :spring_type
      t.decimal :material_dia
      t.decimal :mean_dia
      t.decimal :free_length
      t.decimal :no_of_active_coils
      t.decimal :solid_length_max
      t.decimal :dimension_f1
      t.decimal :dimension_l1
      t.decimal :dimension_f2
      t.decimal :dimension_l2
      t.decimal :initial_load_nm
      t.decimal :final_load_nm
      t.decimal :torque_arm_length
      t.decimal :hook_length
      t.decimal :hook_arc_radius
      t.decimal :spring_constant
      t.string :unit
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
      t.boolean :need_to_edit_spring_type
      t.boolean :need_to_edit_material_dia
      t.boolean :need_to_edit_mean_dia
      t.boolean :need_to_edit_free_length
      t.boolean :need_to_edit_no_of_active_coils
      t.boolean :need_to_edit_solid_length_max
      t.boolean :need_to_edit_dimension_f1
      t.boolean :need_to_edit_dimension_l1
      t.boolean :need_to_edit_dimension_f2
      t.boolean :need_to_edit_dimension_l2
      t.boolean :need_to_edit_initial_load_nm
      t.boolean :need_to_edit_final_load_nm
      t.boolean :need_to_edit_torque_arm_length
      t.boolean :need_to_edit_hook_length
      t.boolean :need_to_edit_hook_arc_radius
      t.boolean :need_to_edit_spring_constant
      t.boolean :need_to_edit_unit
      t.boolean :need_to_edit_supplier
      t.boolean :need_to_edit_drawing_norm
      t.boolean :need_to_edit_where_used_product
      t.boolean :need_to_edit_where_used_plant
      t.boolean :need_to_edit_remark

      t.timestamps
    end
  end
end
