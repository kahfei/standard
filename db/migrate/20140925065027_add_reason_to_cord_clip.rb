class AddReasonToCordClip < ActiveRecord::Migration
  def change
    add_column :cord_clips, :reason, :string
  end
end
