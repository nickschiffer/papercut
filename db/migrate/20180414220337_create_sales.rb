class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.integer :seller_id
      t.integer :buyer_id

      t.belongs_to :user
      t.has_many :books

      t.timestamps
    end
  end
end
