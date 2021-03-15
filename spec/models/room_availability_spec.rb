require "rails_helper"

RSpec.describe RoomAvailability, type: :model do
  it { should belong_to(:hotel) }
end
