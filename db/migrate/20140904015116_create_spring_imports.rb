class CreateSpringImports < ActiveRecord::Migration
  def change
    create_table :spring_imports do |t|

      t.timestamps
    end
  end
end
