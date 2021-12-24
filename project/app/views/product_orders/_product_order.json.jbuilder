json.extract! product_order, :id, :spec_id, :product_id, :order_id, :quantity, :amount, :created_at, :updated_at
json.url product_order_url(product_order, format: :json)
