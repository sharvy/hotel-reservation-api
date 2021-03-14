class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :hotel

  validates :arrival_date, :departure_date, presence: true
  validates :number_of_rooms, numericality: { only_integer: true, greater_than: 0 }
end
