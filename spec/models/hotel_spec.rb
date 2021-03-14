require "rails_helper"

RSpec.describe Hotel, type: :model do
  it { should have_many(:reservations) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:city) }
  
  it { should validate_numericality_of(:number_of_rooms).only_integer }
  it { should validate_numericality_of(:price_per_room) }
end
