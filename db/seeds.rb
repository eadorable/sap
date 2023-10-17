require 'faker'

puts "Cleaning up database..."
Booking.destroy_all
Activity.destroy_all
Category.destroy_all
User.destroy_all
puts "Database cleaned"

puts "Building DB..."

puts "Creating users..."

users = [] # Create an empty array to store the users
users << User.create!(
  first_name: 'Erwin',
  last_name: 'Doe',
  email: 'erwin@example.com',
  password: '123456'
)

users << User.create!(
  first_name: 'Ardian',
  last_name: 'Doe',
  email: 'ardian@example.com',
  password: '123456'
)

users << User.create!(
  first_name: 'Steven',
  last_name: 'Doe',
  email: 'steven@example.com',
  password: '123456'
)

users << User.create!(
  first_name: 'Akane',
  last_name: 'Doe',
  email: 'akane@example.com',
  password: '123456'
)

puts "Creating categories..."
categories = ['outdoor', 'indoor'] # Create an array with the categories
10.times do
  Category.create!(
    name: categories.sample # Use sample to select a random category
  )
end

puts "Creating activities..."
difficulty = [1, 2, 3, 4, 5] # Create an array with the difficulties
10.times do
  Activity.create!(
    name: 'Hiking',
    address: Faker::Address.full_address,
    date_time: Faker::Time,
    description: Faker::Lorem.sentence(word_count: 10),
    owner: users.sample,  # Use sample to select a random user
    difficulty: difficulty.sample,
    equipment: Faker::Lorem.word,
    category: Category.all.sample  # Use Category.first to select the first category
  )
end

puts "Creating bookings..."
10.times do
  Booking.create!(
    status: true,
    activity: Activity.all.sample,  # Use Activity.all.sample to select a random activity
    participant: User.all.sample  # Use User.all.sample to select a random user
  )
end

puts "DB created"
