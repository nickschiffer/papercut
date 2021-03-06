class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :condition
      t.string :ISBN
      t.integer :user_id
      t.float :value, :default => 0.00
      t.boolean :visibility, :default => true
      
      
      t.belongs_to :post
      

      t.timestamps
    end
    add_index :books, :title
    add_index :books, :author
    add_index :books, :ISBN
  end
end
