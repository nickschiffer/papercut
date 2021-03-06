class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :slug
      t.belongs_to :user
      t.string :image

      t.float    :latitude
      t.float    :longitude

      t.timestamps
    end
    add_index :posts, :slug, unique: true
  end
end
