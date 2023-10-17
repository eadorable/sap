# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning up database..."
Booking.destroy_all
Activity.destroy_all
Category.destroy_all
User.destroy_all

puts "Database cleaned"
puts "Creating users..."
User.create!(
  first_name: 'Erwin',
  last_name: 'Doe',
  email: 'erwin@example.com',
  password: '123456'
)

puts "User created"
puts "Creating activities..."

Category.create!(
  name: 'outdoor'
)

Activity.create!(
  name: 'Hiking',
  address: 'Rue de la Loi 155, 1040 Brussels',
  date_time: '2021-10-20 10:00:00',
  description: 'Hiking in the forest',
  owner_id: User.first.id,
  difficulty: 3,
  equipment: 'Hiking shoes',
  category_id: Category.first.id
)

Booking.create!(
  status: true,
  activity_id: Activity.first.id,
  participant_id: User.first.id
)
puts "Activity created"
puts "Finished!"
