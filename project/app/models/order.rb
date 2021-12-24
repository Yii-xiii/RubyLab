class Order < ApplicationRecord
  belongs_to :customer, class_name: "User"
  has_many :productOrders, dependent: :destroy
  enum status:[:Paid, :Delivering, :Received, :Cancel]
end
