json.extract! order, :id, :customer_id, :name, :address, :phone_number, :postcode, :status, :time, :created_at, :updated_at
json.url order_url(order, format: :json)
