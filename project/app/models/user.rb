class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_initialize :set_default_role, :if => :new_record?
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:customer, :seller]
  has_many :products, dependent: :destroy, foreign_key: "seller_id"
  has_many :carts, dependent: :destroy
  has_many :collections, dependent: :destroy
  has_many :orders, dependent: :destroy, foreign_key: "customer_id"

  def set_default_role
    self.role ||= :customer
    self.save()
  end
end
