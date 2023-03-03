# create 10 users
5.times do |i|
  User.create!(
    email: "user#{i+1}@example.com",
    password: "password12",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    # profile_picture: Faker::LoremPixel.image(size: "50x50"),
    admin: false
  )
  puts "user #{i+1} created"
end

# create 10 boats
5.times do |i|
  Boat.create!(
    title: Faker::JapaneseMedia::OnePiece.sea,
    price_per_day: rand(1000..10000),
    user_id: rand(1..5),
    # type: "yacht",
    description: Faker::Lorem.paragraph,
    capacity: rand(1..10),
    address: "Forellenweg 9, 8038 Zürich",
    picture: "https://source.unsplash.com/300x200/?boat/",
    manufacturing_year: rand(2000..2022),
    with_crew: Faker::Boolean.boolean,
    availability: Faker::Boolean.boolean,
  )
  puts "boat #{i+1} created"
end

# create 10 bookings
10.times do |i|
  Booking.create!(
    check_in: Faker::Date.forward(days: 10),
    check_out: Faker::Date.forward(days: 20),
    boat_id: rand(1..5),
    user_id: rand(1..5),
    booking_price: rand(500..5000),
    status: 'pending'
  )
  puts "booking #{i+1}created"
end
