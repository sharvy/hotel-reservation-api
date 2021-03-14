class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :hotels, through: :reservations

  validates :first_name, :last_name, :email, :phone, presence: true
  validates :email, uniqueness: true
end
