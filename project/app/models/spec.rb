class Spec < ApplicationRecord
    belongs_to :product
    has_many :carts, dependent: :destroy
    has_many :productOrders, dependent: :destroy
end
