FactoryBot.define do
  factory :room_availability do
    hotel { nil }
    date { "2021-03-15" }
    available_rooms { 1 }
  end
end
