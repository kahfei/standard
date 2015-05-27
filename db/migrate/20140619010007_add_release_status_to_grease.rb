class AddReleaseStatusToGrease < ActiveRecord::Migration
  def self.up
    #add_column :greases, :release_status, :string
    add_column :greases, :release_status, :string
  end

  def self.down
    remove_column :greases, :release_status
  end
end
