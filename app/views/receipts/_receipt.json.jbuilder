json.extract! receipt, :id, :created_at, :updated_at, :buyer_id, :buyer_firstname, :buyer_lastname, :buyer_email, :seller_id, :seller_firstname, :seller_lastname, :seller_email, :book_title, :book_author, :book_isbn, :trade_title, :trade_author, :trade_isbn, :payment_method, :amount
json.url receipt_url(receipt, format: :json)
