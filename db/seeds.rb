require 'faker'
require 'time'

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
outdoor = Category.create!(name: 'Outdoor')
indoor = Category.create!(name: 'Indoor')
art = Category.create!(name: 'Art')
cooking = Category.create!(name: 'Cooking')
sport = Category.create!(name: 'Sport')
fitness = Category.create!(name: 'Fitness')
community = Category.create!(name: 'Community')
games = Category.create!(name: 'Games')
health = Category.create!(name: 'Health')
hobbies = Category.create!(name: 'Hobbies')
languages = Category.create!(name: 'Languages')
music = Category.create!(name: 'Music')
social = Category.create!(name: 'Social')
support = Category.create!(name: 'Support')
dance = Category.create!(name: 'Dance')
pets = Category.create!(name: 'Pets')

puts "Creating activities..."
class Time
  def round_off(seconds = 60)
    Time.at((self.to_f / seconds).round * seconds)
  end
end

def create_random_date_time
  date = Faker::Date.between(from: '2023-10-25', to: '2023-12-31')
  Time.new(date.year, date.month, date.day, rand(10..18).to_s, %w[00 30].sample)
end

Activity.create!(
  name: 'Hiking',
  address: 'Friedrichstrasse 42, 10117 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Explore the great outdoors and enjoy nature with fellow enthusiasts.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Comfortable hiking shoes',
  category: outdoor
)
Activity.create!(
  name: 'Indoor Rock Climbing',
  address: 'Kurfürstendamm 8, 10719 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Stay active indoors with exciting indoor activities and sports.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Athletic wear and sneakers',
  category: indoor
)
Activity.create!(
  name: 'Visiting a Museum',
  address: 'Breitscheidplatz 7, 10785 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Experience the world of art and culture through museum visits and artistic endeavors.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Apron or old clothes',
  category: art
)
Activity.create!(
  name: 'Culinary Delights Masterclass',
  address: 'Mohrenstrasse 37, 10117 Berlin Germany',
  date_time: create_random_date_time,
  description: 'Discover your culinary talents with cooking classes and gastronomic experiences.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Appetite for delicious food',
  category: cooking
)
Activity.create!(
  name: 'Football',
  address: 'Lützowplatz 17, 10785 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Get moving and participate in thrilling sports and athletic events.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Sports gear and appropriate clothing',
  category: sport
)
Activity.create!(
  name: 'Wellness and Fitness Retreat',
  address: 'Dorotheenstraße 84, 10117 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Improve your fitness and well-being through yoga, workouts, and more.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Yoga mat',
  category: fitness
)
Activity.create!(
  name: 'Community Care Day',
  address: 'Stefan-Heym-Platz 1, 10367 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Give back to the community through volunteer work and community service.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Comfortable clothing for volunteering',
  category: community
)
Activity.create!(
  name: 'Board Game Bonanza',
  address: 'Mohrenstrasse 30, 10117 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Challenge your strategic thinking and have fun with board games and puzzles.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Favorite board games or card decks',
  category: games
)
Activity.create!(
  name: 'Holistic Health and Wellness Workshop',
  address: 'Torstrasse 1, 10119, Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Focus on your well-being with wellness workshops and health-related activities.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Comfortable clothing for yoga or meditation',
  category: health
)
Activity.create!(
  name: 'Hobby Enthusiasts Gathering',
  address: 'Nordufer 20, 13353 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Pursue your hobbies and passions with like-minded individuals.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Your hobby equipment or materials',
  category: hobbies
)
Activity.create!(
  name: 'Language Exchange Fiesta',
  address: 'Lützowplatz 17, 10785 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Expand your linguistic horizons and engage in language exchange activities.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Openness to new languages and experiences',
  category: languages
)
Activity.create!(
  name: 'Harmonious Melodies Concert',
  address: 'Möckernstrasse 10, 10963 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Enjoy the magic of live music performances and musical gatherings.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Love for live music',
  category: music
)
Activity.create!(
  name: 'Social Soiree: Mix and Mingle',
  address: 'Kantstraße 148, 10623 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Meet new people and socialize at various social events and mixers.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Friendly and open attitude',
  category: social
)
Activity.create!(
  name: 'Support Circle: Finding Strength Together',
  address: 'Mehringdamm 33, 10961 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Find support and encouragement through support group meetings and counseling.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Openness to share and listen',
  category: support
)
Activity.create!(
  name: 'Dance Fusion Fever',
  address: 'Egelingzeile 6, 12103 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Move to the rhythm and express yourself with dance classes and dance events.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Dance-appropriate clothing and shoes',
  category: dance
)
Activity.create!(
  name: 'Paws and Play: Pet Adoption Event',
  address: 'Köpenicker Str. 163, 12355 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Connect with adorable pets and consider adopting a furry friend.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Pet adoption application',
  category: pets
)
Activity.create!(
  name: 'Tennis Tournament',
  address: 'Am Friedrichshain 1, 10249 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Serve and volley your way to victory in our friendly tennis tournament. Compete with fellow tennis enthusiasts and enjoy a day on the court.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Tennis racket, tennis balls, tennis shoes',
  category: sport
)
Activity.create!(
  name: 'Basketball Pickup Game',
  address: 'Körtestraße 15, 10967 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Lace up your basketball shoes and get ready to shoot some hoops. Join our pickup game for an afternoon of fast-paced basketball action.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Basketball shoes, comfortable athletic attire',
  category: sport
)
Activity.create!(
  name: 'Wellness Workshop',
  address: 'Rudi-Dutschke-Straße 23, 10969 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Join our wellness workshop designed for seniors to enhance physical and mental well-being. Learn about exercises, nutrition, and relaxation techniques for a healthier lifestyle.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'An open mind for learning and self-care',
  category: support
)
Activity.create!(
  name: 'Memory Lane: Reminiscence Group',
  address: 'Oranienburger Str. 28, 10117 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Share and cherish your life stories with fellow seniors in a warm and supportive environment. This group session promotes memory recall and emotional connection.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: "Any memorabilia or photographs you'd like to discuss, a journal",
  category: support
)
Activity.create!(
  name: 'Supportive Caregiver Symposium',
  address: 'Luckenwalder Str. 3, 10963 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'A symposium designed for both seniors and their caregivers. Gain valuable insights, share experiences, and connect with others facing similar challenges.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Any relevant medical or caregiving documents',
  category: support
)
Activity.create!(
  name: 'Peaceful Minds Meditation Gathering',
  address: 'Georgenstraße 23, 10117 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Cultivate inner peace and mindfulness with our meditation group. Relax, de-stress, and share positive energy with like-minded seniors.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Comfortable clothing, a cushion or mat for sitting, and an open, tranquil mind.',
  category: support
)
puts "DB created"
