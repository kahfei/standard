class AddNeedToEditSupplierToGreases < ActiveRecord::Migration
  def self.up
    add_column :greases, :need_to_edit_supplier, :boolean
  end

  def self.down
    remove_column :greases, :need_to_edit_supplier
  end
end
