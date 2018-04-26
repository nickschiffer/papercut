class AddFirstNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :payment_method, :string, :default => "credit_card"
    add_column :users, :payment_verified, :boolean, :default => false
    add_column :users, :isAdmin, :boolean, :default => false
  end
end
