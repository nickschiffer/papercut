json.extract! book, :id, :title, :author, :condition, :ISBN, :created_at, :updated_at
json.url book_url(book, format: :json)
