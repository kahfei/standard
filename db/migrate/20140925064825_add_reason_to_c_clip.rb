class AddReasonToCClip < ActiveRecord::Migration
  def change
    add_column :c_clips, :reason, :string
  end
end
