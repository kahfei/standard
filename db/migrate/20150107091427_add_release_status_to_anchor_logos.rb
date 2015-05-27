class AddReleaseStatusToAnchorLogos < ActiveRecord::Migration
  def change
    add_column :anchor_logos, :release_status, :string
  end
end
