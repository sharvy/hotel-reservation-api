FactoryBot.define do
  factory :hotel do
    name { Faker::Company.name }
    city { Faker::Address.city }
    number_of_rooms { 5 }
    price_per_room { 1.5 }
  end
end
