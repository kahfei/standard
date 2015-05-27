class CreateCordClipImports < ActiveRecord::Migration
  def change
    create_table :cord_clip_imports do |t|

      t.timestamps
    end
  end
end
