class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.text :body
      t.string :slug
      t.belongs_to :post
      t.belongs_to :user

      t.timestamps
    end
    add_index :replies, :slug, unique: true
  end
end
