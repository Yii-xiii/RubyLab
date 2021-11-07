class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :followships, dependent: :destroy
  has_many :reversed_followships, class_name: "Followship", foreign_key:"following_user_id", dependent: :destroy

  has_many :followings, through: :followships, dependent: :destroy
  has_many :followers, through: :reversed_followships, dependent: :destroy

end
