class FixUsedInColumn < ActiveRecord::Migration
  def self.up
	  rename_column :parts, :used_in, :project
  end

  def self.down
  end
end
