class CreateCClips < ActiveRecord::Migration
  def self.up
    create_table :c_clips do |t|
      t.string :partnumber
      t.string :description
      t.string :clip_type
      t.decimal :norminal_diameter
      t.decimal :thickness
      t.string :coating
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
      t.boolean :need_to_edit_clip_type
      t.boolean :need_to_edit_norminal_diameter
      t.boolean :need_to_edit_thickness
      t.boolean :need_to_edit_coating
      t.boolean :need_to_edit_drawing_norm
      t.boolean :need_to_edit_where_used_product
      t.boolean :need_to_edit_where_used_plant
      t.boolean :need_to_edit_remark

      t.timestamps
    end
  end

  def self.down
    drop_table :c_clips
  end
end
