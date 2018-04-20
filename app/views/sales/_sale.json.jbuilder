json.extract! sale, :id, :created_at, :updated_at, :buyer_id, :seller_id, :book_id, :trade_id
json.url sale_url(sale, format: :json)
