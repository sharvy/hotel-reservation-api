FactoryBot.define do
  factory :reservation do
    user { nil }
    hotel { nil }
    arrival_date { Date.today + 2.days }
    departure_date { Date.today + 3.days }
    number_of_rooms { 5 }
  end
end
