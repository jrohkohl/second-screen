json.extract! comment, :id, :body, :post_id, :owner_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
