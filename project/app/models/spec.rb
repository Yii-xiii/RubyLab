class Spec < ApplicationRecord
    belongs_to :product
    has_many :carts
    has_many :productOrders
end
