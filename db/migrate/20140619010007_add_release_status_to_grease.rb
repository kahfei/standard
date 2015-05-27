class AddReleaseStatusToGrease < ActiveRecord::Migration
  def self.up
    #add_column :greases, :release_status, :string
    change_column :greases, :release_status, :string, default: "pending"
  end

  def self.down
    remove_column :greases, :release_status
  end
end
