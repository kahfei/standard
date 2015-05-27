class AddFullnameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :fullname, :string
    add_column :users, :department, :string
    add_column :users, :email, :string
    add_column :users, :phone, :string
    add_column :users, :location, :string
  end

  def self.down
    remove_column :users, :fullname
    remove_column :users, :department
    remove_column :users, :email, :string
    remove_column :users, :phone, :string
    remove_column :users, :location, :string
  end
end
