class CreateCapacitorImports < ActiveRecord::Migration
  def change
    create_table :capacitor_imports do |t|
      t.string :new
      t.string :create

      t.timestamps
    end
  end
end
