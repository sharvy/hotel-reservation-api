class Hotel < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :user, through: :reservations
end
