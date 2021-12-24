class Product < ApplicationRecord
    after_initialize :set_default, :if => :new_record?

    has_one_attached :image
    has_many :specs, dependent: :destroy
    belongs_to :seller, class_name: "User"
    has_many :collections, dependent: :destroy
    has_many :productOrders

    def set_default
        self.sold = 0
        self.save()
    end
end
