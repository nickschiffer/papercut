class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :condition
      t.string :ISBN
      t.float :value, :default => 0.00
      
      t.belongs_to :post
      

      t.timestamps
    end
    add_index :books, :title, unique: true
    add_index :books, :author
    add_index :books, :ISBN, unique: true
  end
end
