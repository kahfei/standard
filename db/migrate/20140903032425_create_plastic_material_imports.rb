class CreatePlasticMaterialImports < ActiveRecord::Migration
  def change
    create_table :plastic_material_imports do |t|

      t.timestamps
    end
  end
end
