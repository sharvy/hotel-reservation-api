class Hotel < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :user, through: :reservations
  has_many :room_availabilities, dependent: :destroy

  validates :name, :city, presence: true
  validates :number_of_rooms, numericality: { only_integer: true }
  validates :price_per_room, numericality: true

  after_create :generate_availability

  private

  def generate_availability
    GenerateNewHotelAvailabilityJob.perform_now(self)
  end
end
