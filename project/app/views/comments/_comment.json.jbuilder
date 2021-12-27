json.extract! comment, :id, :content, :rating, :product_order_id, :product_id, :user_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
