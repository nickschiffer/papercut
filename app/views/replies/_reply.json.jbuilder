json.extract! reply, :id, :body, :slug, :created_at, :updated_at, :post_id
json.url reply_url(reply, format: :json)
