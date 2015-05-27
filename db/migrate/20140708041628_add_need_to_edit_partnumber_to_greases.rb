class AddNeedToEditPartnumberToGreases < ActiveRecord::Migration
  def self.up
    add_column :greases, :need_to_edit_partnumber, :boolean
  end

  def self.down
    remove_column :greases, :need_to_edit_partnumber
  end
end
