class CreateGreases < ActiveRecord::Migration
  def self.up
    create_table :greases do |t|
      t.string :partnumber
      t.string :description
      t.string :grease_type
      t.string :lubricated_location
      t.string :drawing_norm
      t.string :supplier
      t.string :where_used_product

      t.timestamps
    end
  end

  def self.down
    drop_table :greases
  end
end
