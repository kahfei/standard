class CreateAnchorLogos < ActiveRecord::Migration
  def change
    create_table :anchor_logos do |t|
      t.string :housing_partnumber
      t.string :housing_supplier
      t.decimal :anchor_logo_diameter
      t.string :anchor_logo_partnumber
      t.string :anchor_logo_supplier
      t.string :bosch_logo_partnumber
      t.string :bosch_logo_supplier
      t.string :where_used_product
      t.string :where_used_plant
      t.string :remark
      t.string :reason

      t.timestamps
    end
  end
end
