class CreateCClipImports < ActiveRecord::Migration
  def change
    create_table :c_clip_imports do |t|

      t.timestamps
    end
  end
end
