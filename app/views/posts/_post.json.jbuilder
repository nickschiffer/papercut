json.extract! post, :id, :title, :body, :slug, :created_at, :updated_at, :latitude, :longitude
json.url post_url(post, format: :json)
