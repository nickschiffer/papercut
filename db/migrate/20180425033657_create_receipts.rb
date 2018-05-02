class CreateReceipts < ActiveRecord::Migration[5.1]
  def change
    create_table :receipts do |t|
      t.integer :buyer_id
      t.string :buyer_firstname
      t.string :buyer_lastname
      t.string :buyer_email
      t.integer :seller_id
      t.string :seller_firstname
      t.string :seller_lastname
      t.string :seller_email
      t.string :book_title
      t.string :book_author
      t.string :book_isbn
      t.string :trade_title
      t.string :trade_author
      t.string :trade_isbn
      t.string :payment_method
      t.float :amount, :default => 0.00

      t.timestamps
    end
  end
end
