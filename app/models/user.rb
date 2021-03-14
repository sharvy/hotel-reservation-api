class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :hotels, through: :reservations
end
