json.extract! book, :id, :title, :author, :condition, :ISBN, :created_at, :updated_at, :post_id, :image, :value
json.url book_url(book, format: :json)
