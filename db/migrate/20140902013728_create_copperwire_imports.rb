class CreateCopperwireImports < ActiveRecord::Migration
  def change
    create_table :copperwire_imports do |t|

      t.timestamps
    end
  end
end
