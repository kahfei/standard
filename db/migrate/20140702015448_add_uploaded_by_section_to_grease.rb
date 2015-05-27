class AddUploadedBySectionToGrease < ActiveRecord::Migration
  def self.up
    add_column :greases, :uploaded_by_section, :string
  end

  def self.down
    remove_column :greases, :uploaded_by_section
  end
end
