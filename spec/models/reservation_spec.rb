require "rails_helper"

RSpec.describe Reservation, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:hotel) }

  it { should validate_presence_of(:arrival_date) }
  it { should validate_presence_of(:departure_date) }
  
  it { should validate_numericality_of(:number_of_rooms).only_integer.is_greater_than(0) }
end
