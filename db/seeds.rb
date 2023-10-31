require 'faker'
require 'time'

puts "Cleaning up database..."
Message.destroy_all
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
community = Category.create!(name: 'Community')
support = Category.create!(name: 'Support')
fitness = Category.create!(name: 'Fitness')
outdoors = Category.create!(name: 'Outdoors')
learning = Category.create!(name: 'Learning')
arts = Category.create!(name: 'Arts')
entertainment = Category.create!(name: 'Entertainment')
wellness = Category.create!(name: 'Wellness')

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


# activity_photos = ["https://res.cloudinary.com/dvbboesg3/image/upload/v1698739889/Screenshot_2023-10-31_at_09.10.45_mqhhy1.png", "https://images.unsplash.com/photo-1551632811-561732d1e306?auto=format&fit=crop&q=80&w=3540&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"]

# first_activity = Activity.new(
#   name: 'Hiking',
#   address: 'Friedrichstrasse 42, 10117 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'Explore the great outdoors and enjoy nature with fellow enthusiasts.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Comfortable hiking shoes',
#   category: outdoors,
#   max_count: 2,
#   chatroom: Chatroom.new
# )

# activity_photos.each_with_index do |photo, index|
#   file = URI.open(photo)
#   first_activity.photos.attach(io: file, filename: "mountaing-#{index+1}.png", content_type: "image/png")
#   first_activity.save!
# end


hiking_activity_photos = ["https://images.unsplash.com/photo-1656892777216-eeb8cf1f4986?auto=format&fit=crop&q=80&w=3387&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "https://images.unsplash.com/photo-1553755322-9166c447242c?auto=format&fit=crop&q=80&w=3688&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"]

first_activity = Activity.new(
  name: 'Hiking',
  address: 'Friedrichstrasse 42, 10117 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Explore the great outdoors and enjoy nature with fellow enthusiasts.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Comfortable hiking shoes',
  category: outdoors,
  max_count: 2,
  chatroom: Chatroom.new
)

hiking_activity_photos.each_with_index do |photo, index|
  file = URI.open(photo)
  first_activity.photos.attach(io: file, filename: "mountaing-#{index+1}.png", content_type: "image/png")
  first_activity.save!
end



climbing_photo = URI.open("https://images.unsplash.com/photo-1659666287295-7da26c3f80d4?auto=format&fit=crop&q=80&w=3387&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")

second_activity = Activity.new(
  name: 'Indoor Rock Climbing',
  address: 'Kurfürstendamm 8, 10719 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Stay active indoors with exciting indoor activities and sports.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Athletic wear and sneakers',
  category: fitness,
  max_count: 9,
  chatroom: Chatroom.new
)

second_activity.photos.attach(io: climbing_photo, filename: "rocks.png", content_type: "image/png")
second_activity.save!




# Activity.create!(
#   name: 'Visiting a Museum',
#   address: 'Breitscheidplatz 7, 10785 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'Experience the world of art and culture through museum visits and artistic endeavors.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Apron or old clothes',
#   category: arts,
#   max_count: 8,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Culinary Delights Masterclass',
#   address: 'Mohrenstrasse 37, 10117 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'Discover your culinary talents with cooking classes and gastronomic experiences.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Appetite for delicious food',
#   category: learning,
#   max_count: 7,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Football',
#   address: 'Lützowplatz 17, 10785 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'Get moving and participate in thrilling sports and athletic events.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Sports gear and appropriate clothing',
#   category: fitness,
#   max_count: 6,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Fitness Retreat',
#   address: 'Dorotheenstraße 84, 10117 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'Improve your fitness and well-being through yoga, workouts, and more.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Yoga mat',
#   category: fitness,
#   max_count: 5,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Community Care Day',
#   address: 'Stefan-Heym-Platz 1, 10367 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'Give back to the community through volunteer work and community service.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Comfortable clothing for volunteering',
#   category: community,
#   max_count: 5,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Board Game Bonanza',
#   address: 'Mohrenstrasse 30, 10117 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'Challenge your strategic thinking and have fun with board games and puzzles.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Favorite board games or card decks',
#   category: entertainment,
#   max_count: 5,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Holistic Health and Wellness Workshop',
#   address: 'Torstrasse 1, 10119, Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'Focus on your well-being with wellness workshops and health-related activities.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Comfortable clothing for yoga or meditation',
#   category: wellness,
#   max_count: 5,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Hobby Enthusiasts Gathering',
#   address: 'Nordufer 20, 13353 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'Pursue your hobbies and passions with like-minded individuals.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Your hobby equipment or materials',
#   category: entertainment,
#   max_count: 5,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Language Exchange Fiesta',
#   address: 'Lützowplatz 17, 10785 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'Expand your linguistic horizons and engage in language exchange activities.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Openness to new languages and experiences',
#   category: learning,
#   max_count: 5,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Harmonious Melodies Concert',
#   address: 'Möckernstrasse 10, 10963 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'Enjoy the magic of live music performances and musical gatherings.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Love for live music',
#   category: entertainment,
#   max_count: 5,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Social Soiree: Mix and Mingle',
#   address: 'Kantstraße 148, 10623 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'Meet new people and socialize at various social events and mixers.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Friendly and open attitude',
#   category: community,
#   max_count: 5,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Support Circle: Finding Strength Together',
#   address: 'Mehringdamm 33, 10961 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'Find support and encouragement through support group meetings and counseling.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Openness to share and listen',
#   category: support,
#   max_count: 5,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Dance Fusion Fever',
#   address: 'Egelingzeile 6, 12103 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'Move to the rhythm and express yourself with dance classes and dance events.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Dance-appropriate clothing and shoes',
#   category: entertainment,
#   max_count: 5,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Paws and Play: Pet Adoption Event',
#   address: 'Köpenicker Str. 163, 12355 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'Connect with adorable pets and consider adopting a furry friend.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Pet adoption application',
#   category: support,
#   max_count: 5,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Tennis Tournament',
#   address: 'Am Friedrichshain 1, 10249 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'Serve and volley your way to victory in our friendly tennis tournament. Compete with fellow tennis enthusiasts and enjoy a day on the court.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Tennis racket, tennis balls, tennis shoes',
#   category: fitness,
#   max_count: 5,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Basketball Pickup Game',
#   address: 'Körtestraße 15, 10967 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'Lace up your basketball shoes and get ready to shoot some hoops. Join our pickup game for an afternoon of fast-paced basketball action.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Basketball shoes, comfortable athletic attire',
#   category: fitness,
#   max_count: 5,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Wellness Workshop',
#   address: 'Rudi-Dutschke-Straße 23, 10969 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'Join our wellness workshop designed for seniors to enhance physical and mental well-being. Learn about exercises, nutrition, and relaxation techniques for a healthier lifestyle.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'An open mind for learning and self-care',
#   category: wellness,
#   max_count: 5,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Memory Lane: Reminiscence Group',
#   address: 'Oranienburger Str. 28, 10117 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'Share and cherish your life stories with fellow seniors in a warm and supportive environment. This group session promotes memory recall and emotional connection.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: "Any memorabilia or photographs you'd like to discuss, a journal",
#   category: support,
#   max_count: 10,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Supportive Caregiver Symposium',
#   address: 'Luckenwalder Str. 3, 10963 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'A symposium designed for both seniors and their caregivers. Gain valuable insights, share experiences, and connect with others facing similar challenges.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Any relevant medical or caregiving documents',
#   category: support,
#   max_count: 10,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Peaceful Minds Meditation Gathering',
#   address: 'Georgenstraße 23, 10117 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'Cultivate inner peace and mindfulness with our meditation group. Relax, de-stress, and share positive energy with like-minded seniors.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Comfortable clothing, a cushion or mat for sitting, and an open, tranquil mind',
#   category: support,
#   max_count: 10,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Senior Yoga Retreat',
#   address: 'Reinhardtstraße 14, 10117 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'This retreat will help you improve flexibility, balance, and overall well-being. Guided by experienced instructors.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'yoga mat, water bottle, comfortable clothing',
#   category: wellness,
#   max_count: 15,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Tai Chi for Seniors',
#   address: 'Akazienstraße 27, 10823 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'This class will focus on gentle movements and breathing techniques to enhance balance, reduce pain, and promote a sense of calm.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Loose-fitting clothing, comfortable shoes',
#   category: wellness,
#   max_count: 15,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Volunteer Gardening Day',
#   address: 'Elsenstraße 82, 12059 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'Help beautify the neighborhood while connecting with other seniors who share your love for gardening.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Gardening gloves, a sun hat, and your green thumb',
#   category: community,
#   max_count: 5,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Storytelling Circle',
#   address: 'Voxstraße 2, 10785 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'Share and listen to captivating stories from your life and experiences. This community event provides a platform to inspire one another through storytelling.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Your favorite story or memory to share',
#   category: community,
#   max_count: 8,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Birdwatching Adventure',
#   address: 'Havelchaussee 61, 14193 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: "Guided by experienced birdwatchers, you'll observe and learn about local bird species in their natural habitat.",
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Binoculars, bird guidebook, and comfortable walking shoes',
#   category: outdoors,
#   max_count: 8,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Scenic Picnic by the Lake',
#   address: 'Moorlakeweg 6, 14109 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'Enjoy the beauty of the outdoors with a scenic picnic by the lake. Relax by the water and engage in friendly conversations with others.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Picnic basket, comfortable picnic blanket, sunscreen, and your favorite picnic snacks',
#   category: outdoors,
#   max_count: 10,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Hiking Expedition',
#   address: 'Fercher Str. 2, 12629 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'Challenge yourself with a senior-friendly hiking expedition. This guided hike will take you through scenic trails, allowing you to connect with nature and enjoy the great outdoors.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Hiking boots, water bottle, walking stick, and a sense of adventure',
#   category: outdoors,
#   max_count: 5,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Monthly Book Club',
#   address: 'Pohlstraße 74, 10785 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: 'Join our book club where you can dive into literature, discuss your favorite books, and discover new ones.',
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'The book of the month and your insights',
#   category: learning,
#   max_count: 5,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Woodwork Workshop',
#   address: 'Josef-Orlopp-Straße 92, 10365 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: "You'll create your own masterpieces under the guidance of skilled art instructors.",
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Your creativity and imagination',
#   category: learning,
#   max_count: 5,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Berlin Gallery Week',
#   address: 'Potsdamer Str. 93, 10785 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: "Showcase your artistic talents in our senior art exhibition. This event provides a platform to display your creative works.",
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'Your art pieces and a passion for the arts',
#   category: arts,
#   max_count: 30,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Pottery and Ceramics Class',
#   address: 'Wollankstraße 72, 13359 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: "Unleash your inner artist with hands-on pottery and ceramics classes. Create beautiful pottery and ceramic pieces, from mugs to sculptures.",
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'An apron and your artistic vision',
#   category: arts,
#   max_count: 5,
#   chatroom: Chatroom.new
# )
# Activity.create!(
#   name: 'Watercolor Painting Workshop',
#   address: 'Donaustraße 16, 12043 Berlin, Germany',
#   date_time: create_random_date_time,
#   description: "Whether you're a seasoned painter or a beginner, this workshop is tailored to your skill level.",
#   owner: users.sample,
#   difficulty: rand(1..5),
#   equipment: 'A smock or apron to protect your clothing',
#   category: arts,
#   max_count: 5,
#   chatroom: Chatroom.new
# )
# puts "DB created"
