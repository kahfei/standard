class AddFieldsToAnchorLogos < ActiveRecord::Migration
  def change
  	add_column :anchor_logos, :uploaded_by_section, :string
  	add_column :anchor_logos, :uploader_role, :string
  	add_column :anchor_logos, :uploader_name, :string
  	add_column :anchor_logos, :need_to_edit_housing_partnumber, :boolean
  	add_column :anchor_logos, :need_to_edit_housing_supplier, :boolean
  	add_column :anchor_logos, :need_to_edit_anchor_logo_diameter, :boolean
  	add_column :anchor_logos, :need_to_edit_anchor_logo_partnumber, :boolean
  	add_column :anchor_logos, :need_to_edit_anchor_logo_supplier, :boolean
  	add_column :anchor_logos, :need_to_edit_bosch_logo_partnumber, :boolean
  	add_column :anchor_logos, :need_to_edit_bosch_logo_supplier, :boolean
  	add_column :anchor_logos, :need_to_edit_where_used_product, :boolean
  	add_column :anchor_logos, :need_to_edit_where_used_plant, :boolean
  	add_column :anchor_logos, :need_to_edit_remark, :boolean
  	add_column :anchor_logos, :need_to_edit_reason, :boolean


  end
end
