class ProductOrder < ApplicationRecord
  belongs_to :spec
  belongs_to :product
  has_one :comment, dependent: :destroy
  belongs_to :order
end
