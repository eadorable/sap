require 'faker'

puts "Cleaning up database..."
Booking.destroy_all
Activity.destroy_all
Category.destroy_all
User.destroy_all
puts "Database cleaned"

puts "Building DB..."

puts "Creating users..."

users_data = [
  { first_name: 'Erwin', last_name: 'Adorable', email: 'erwin@example.com', password: '123456' },
  { first_name: 'Ardian', last_name: 'Idrizi', email: 'ardian@example.com', password: '123456' },
  { first_name: 'Steven', last_name: 'Marquez', email: 'steven@example.com', password: '123456' },
  { first_name: 'Akane', last_name: 'Saito', email: 'akane@example.com', password: '123456' }
]

# Create an empty array to store the users
users = []

# Create users based on the users_data array
users_data.each do |user_data|
  users << User.create!(user_data)
end

puts "Creating categories..."
Category.create!(name: 'Outdoor')
Category.create!(name: 'Indoor')

puts "Creating activities..."
difficulty = [1, 2, 3, 4, 5] # Create an array with the difficulties
name = ['Football', 'Basketball', 'Tennis', 'Volleyball', 'Running', 'Swimming', 'Cycling', 'Hiking', 'Golf', 'Baseball']
addresses = [
  '42 Friedrichstrasse, 10117 Berlin, Germany',
  '15 Karl-Liebknecht-Strasse, 04107 Leipzig, Germany',
  '5 Schlossplatz, 70173 Stuttgart, Germany',
  '23 Königstrasse, 90402 Nuremberg, Germany',
  '8 Kurfürstendamm, 10719 Berlin, Germany',
  '12 Albertstrasse, 68165 Mannheim, Germany',
  '31 Marienplatz, 80331 Munich, Germany',
  '6 Domplatz, 48143 Münster, Germany',
  '7 Breitscheidplatz, 10785 Berlin, Germany',
  '18 Augustusplatz, 04109 Leipzig, Germany'
]
10.times do
  Activity.create!(
    name: name.sample,
    address: addresses.sample,
    date_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short),
    description: Faker::Lorem.sentence(word_count: 10),
    owner: users.sample,  # Use sample to select a random user
    difficulty: difficulty.sample,
    equipment: Faker::Lorem.word,
    category: Category.all.sample  # Use Category.first to select the first category
  )
end
puts "DB created"
