class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.integer :buyer_id
      t.integer :seller_id
      t.integer :book_id
      t.integer :trade_id
      t.integer :state, :default => 0
      t.boolean :verified_by_buyer, :default => false
      t.boolean :verified_by_seller, :default => false
      
      t.timestamps
    end
  end
end
