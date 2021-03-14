20.times do
  Hotel.create!(
    name: Faker::Company.name,
    city: Faker::Address.city,
    number_of_rooms: 10,
    price_per_room: 10.0
  )
end
