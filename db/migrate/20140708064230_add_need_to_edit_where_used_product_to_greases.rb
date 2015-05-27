class AddNeedToEditWhereUsedProductToGreases < ActiveRecord::Migration
  def self.up
    add_column :greases, :need_to_edit_where_used_product, :boolean
  end

  def self.down
    remove_column :greases, :need_to_edit_where_used_product
  end
end
