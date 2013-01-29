class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :company, :string
    add_column :users, :jb_membership, :string
    add_column :users, :phonenumber, :string
  end
end
