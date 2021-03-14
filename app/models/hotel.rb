class Hotel < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :user, through: :reservations

  validates :name, :city, presence: true
  validates :number_of_rooms, numericality: { only_integer: true }
  validates :price_per_room, numericality: true
end
