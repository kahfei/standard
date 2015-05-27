class AddReasonToPlasticMaterial < ActiveRecord::Migration
  def change
    add_column :plastic_materials, :reason, :string
  end
end
