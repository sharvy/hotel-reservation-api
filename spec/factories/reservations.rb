FactoryBot.define do
  factory :reservation do
    user { nil }
    hotel { nil }
    arrival_date { "2021-03-14" }
    departure_date { "2021-03-14" }
    number_of_rooms { 1 }
  end
end
