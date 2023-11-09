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
  { first_name: 'Akane', last_name: 'Saito', email: 'akane@example.com', password: '123456' },
  { first_name: 'Emma', last_name: 'Rünzel', email: 'emma@example.com', password: '123456' },
  { first_name: 'James', last_name: 'Hibbeard', email: 'james@example.com', password: '123456' },
  { first_name: 'Adam', last_name: 'Tomczyk', email: 'adam@example.com', password: '123456' },
  { first_name: 'Michelle', last_name: 'Rodriguez', email: 'michelle@example.com', password: '123456' },
  { first_name: 'Emre', last_name: 'Ebeturk', email: 'emre@example.com', password: '123456' }]

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
  date = Faker::Date.between(from: '2023-11-11', to: '2023-11-30')
  Time.new(date.year, date.month, date.day, rand(10..16).to_s, %w[00 30].sample)
end

gardening_activity_photos = [
  "https://images.pexels.com/photos/7728942/pexels-photo-7728942.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://live.staticflickr.com/65535/53302933750_7f406aa5ff_c.jpg",
  "https://live.staticflickr.com/65535/53302699193_32bbdfd289_c.jpg"]

gardening_activity = Activity.new(
  name: 'Volunteer Gardening Day',
  address: 'Elsenstraße 82, 12059 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Help beautify the neighborhood while connecting with other seniors who share your love for gardening.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Gardening gloves, a sun hat, and your green thumb',
  category: community,
  max_count: 10,
  chatroom: Chatroom.new
  )

gardening_activity_photos.each_with_index do |photo, index|
  file = URI.open(photo)
  gardening_activity.photos.attach(io: file, filename: "gardening-#{index+1}.png", content_type: "image/png")
  gardening_activity.save!
end

gallery_activity_photos = [
  "https://live.staticflickr.com/8105/8538867505_e50b616d13_c.jpg",
  "https://live.staticflickr.com/8508/8516501276_abecbc1a6a_c.jpg",
  "https://live.staticflickr.com/8506/8507527368_c3db40caa5_c.jpg"]

gallery_activity = Activity.new(
  name: 'Berlin Gallery Week',
  address: 'Potsdamer Str. 93, 10785 Berlin, Germany',
  date_time: create_random_date_time,
  description: "Showcase your artistic talents in our senior art exhibition. This event provides a platform to display your creative works.",
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Your art pieces and a passion for the arts',
  category: arts,
  max_count: 30,
  chatroom: Chatroom.new
  )

gallery_activity_photos.each_with_index do |photo, index|
  file = URI.open(photo)
  gallery_activity.photos.attach(io: file, filename: "gallery-#{index+1}.png", content_type: "image/png")
  gallery_activity.save!
end

hiking_activity_photos = [
  "https://res.cloudinary.com/dvbboesg3/image/upload/v1698751100/seniors/mountain-1.jpg",
  "https://res.cloudinary.com/dvbboesg3/image/upload/v1698751103/seniors/mountain-2.jpg",
  "https://res.cloudinary.com/dvbboesg3/image/upload/v1698820945/seniors/mountain-3.png"]

hiking_activity = Activity.new(
  name: 'Hiking',
  address: 'Fasanerie 10, 13469 Berlin, Germany',
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
  hiking_activity.photos.attach(io: file, filename: "hiking-#{index+1}.png", content_type: "image/png")
  hiking_activity.save!
end

bouldering_photo = URI.open("https://res.cloudinary.com/dvbboesg3/image/upload/v1698751106/seniors/bouldering-1.jpg")

bouldering_activity = Activity.new(
  name: 'Indoor Bouldering',
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

bouldering_activity.photos.attach(io: bouldering_photo, filename: "bouldering.png", content_type: "image/png")
bouldering_activity.save!

museum_photo = URI.open("https://live.staticflickr.com/3122/2285949191_76563362b8_c.jpg")

museum_activity = Activity.new(
  name: 'Visiting a Museum',
  address: 'Breitscheidplatz 7, 10785 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Experience the world of art and culture through museum visits and artistic endeavors.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Apron or old clothes',
  category: arts,
  max_count: 10,
  chatroom: Chatroom.new
  )

museum_activity.photos.attach(io: museum_photo, filename: "museum.png", content_type: "image/png")
museum_activity.save!

culinary_photo = URI.open("https://live.staticflickr.com/65535/53302377568_99d1c9f1c7_c.jpg")

culinary_activity = Activity.new(
  name: 'Culinary Delights Masterclass',
  address: 'Mohrenstrasse 37, 10117 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Discover your culinary talents with cooking classes and gastronomic experiences.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Appetite for delicious food',
  category: learning,
  max_count: 10,
  chatroom: Chatroom.new
  )

culinary_activity.photos.attach(io: culinary_photo, filename: "culinary.png", content_type: "image/png")
culinary_activity.save!

football_photo = URI.open("https://images.unsplash.com/photo-1589194560507-658320ba9e73?auto=format&fit=crop&q=80&w=2072&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")

football_activity = Activity.new(
  name: 'Football',
  address: 'Lützowplatz 17, 10785 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Get moving and participate in thrilling sports and athletic events.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Sports gear and appropriate clothing',
  category: fitness,
  max_count: 10,
  chatroom: Chatroom.new
  )

football_activity.photos.attach(io: football_photo, filename: "football.png", content_type: "image/png")
football_activity.save!

retreat_photo = URI.open("https://images.unsplash.com/photo-1586401100295-7a8096fd231a?auto=format&fit=crop&q=80&w=1974&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")

retreat_activity = Activity.new(
  name: 'Fitness Retreat',
  address: 'Dorotheenstraße 84, 10117 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Improve your fitness and well-being through yoga, workouts, and more.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Yoga mat',
  category: fitness,
  max_count: 10,
  chatroom: Chatroom.new
  )

retreat_activity.photos.attach(io: retreat_photo, filename: "retreat.png", content_type: "image/png")
retreat_activity.save!

care_photo = URI.open("https://images.unsplash.com/photo-1474649107449-ea4f014b7e9f?auto=format&fit=crop&q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")

care_activity = Activity.new(
  name: 'Community Care Day',
  address: 'Stefan-Heym-Platz 1, 10367 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Give back to the community through volunteer work and community service.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Comfortable clothing for volunteering',
  category: community,
  max_count: 10,
  chatroom: Chatroom.new
  )

care_activity.photos.attach(io: care_photo, filename: "care.png", content_type: "image/png")
care_activity.save!

language_photo = URI.open("https://images.pexels.com/photos/8153740/pexels-photo-8153740.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")

language_activity = Activity.new(
  name: 'Language Exchange Fiesta',
  address: 'Lützowplatz 17, 10785 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Expand your linguistic horizons and engage in language exchange activities.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Openness to new languages and experiences',
  category: learning,
  max_count: 10,
  chatroom: Chatroom.new
  )

language_activity.photos.attach(io: language_photo, filename: "language.png", content_type: "image/png")
language_activity.save!

melody_photo = URI.open("https://images.pexels.com/photos/2927080/pexels-photo-2927080.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")

melody_activity = Activity.new(
  name: 'Harmonious Melodies Concert',
  address: 'Möckernstrasse 10, 10963 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Enjoy the magic of live music performances and musical gatherings.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Love for live music',
  category: entertainment,
  max_count: 10,
  chatroom: Chatroom.new
  )

melody_activity.photos.attach(io: melody_photo, filename: "melody.png", content_type: "image/png")
melody_activity.save!

mingle_photo = URI.open("https://images.pexels.com/photos/8153964/pexels-photo-8153964.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")

mingle_activity = Activity.new(
  name: 'Social Soiree: Mix and Mingle',
  address: 'Kantstraße 148, 10623 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Meet new people and socialize at various social events and mixers.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Friendly and open attitude',
  category: community,
  max_count: 10,
  chatroom: Chatroom.new
  )

mingle_activity.photos.attach(io: mingle_photo, filename: "mingle.png", content_type: "image/png")
mingle_activity.save!


support_circle_photos = [
  "https://images.pexels.com/photos/3768114/pexels-photo-3768114.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/6647053/pexels-photo-6647053.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://live.staticflickr.com/65535/53302759513_0e14fc0805_c.jpg"]

support_circle_activity = Activity.new(
  name: 'Support Circle: Finding Strength Together',
  address: 'Mehringdamm 33, 10961 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Find support and encouragement through support group meetings and counseling.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Openness to share and listen',
  category: support,
  max_count: 10,
  chatroom: Chatroom.new
  )

support_circle_photos.each_with_index do |photo, index|
  file = URI.open(photo)
  support_circle_activity.photos.attach(io: file, filename: "support-#{index+1}.png", content_type: "image/png")
  support_circle_activity.save!
end

dance_photo = URI.open("https://res.cloudinary.com/dvbboesg3/image/upload/v1698837069/seniors/dance-fusion-1.png")

dance_activity = Activity.new(
  name: 'Dance Fusion Fever',
  address: 'Egelingzeile 6, 12103 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Move to the rhythm and express yourself with dance classes and dance events.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Dance-appropriate clothing and shoes',
  category: entertainment,
  max_count: 10,
  chatroom: Chatroom.new
  )

dance_activity.photos.attach(io: dance_photo, filename: "dance.png", content_type: "image/png")
dance_activity.save!

adoption_photo = URI.open("https://www.stockvault.net/data/2008/07/08/105825/preview16.jpg")

adoption_activity = Activity.new(
  name: 'Paws and Play: Pet Adoption Event',
  address: 'Köpenicker Str. 163, 12355 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Connect with adorable pets and consider adopting a furry friend.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Pet adoption application',
  category: support,
  max_count: 10,
  chatroom: Chatroom.new
  )

adoption_activity.photos.attach(io: adoption_photo, filename: "adoption.png", content_type: "image/png")
adoption_activity.save!

tennis_photo = URI.open("https://res.cloudinary.com/dvbboesg3/image/upload/v1698779742/seniors/tennis-1.png")

tennis_activity = Activity.new(
  name: 'Tennis Tournament',
  address: 'Am Friedrichshain 1, 10249 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Serve and volley your way to victory in our friendly tennis tournament. Compete with fellow tennis enthusiasts and enjoy a day on the court.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Tennis racket, tennis balls, tennis shoes',
  category: fitness,
  max_count: 10,
  chatroom: Chatroom.new
  )

tennis_activity.photos.attach(io: tennis_photo, filename: "tennis.png", content_type: "image/png")
tennis_activity.save!

wellness_photo = URI.open("https://images.pexels.com/photos/8436722/pexels-photo-8436722.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")

wellness_activity = Activity.new(
  name: 'Wellness Workshop',
  address: 'Rudi-Dutschke-Straße 23, 10969 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Join our wellness workshop designed for seniors to enhance physical and mental well-being. Learn about exercises, nutrition, and relaxation techniques for a healthier lifestyle.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'An open mind for learning and self-care',
  category: wellness,
  max_count: 10,
  chatroom: Chatroom.new
  )

wellness_activity.photos.attach(io: wellness_photo, filename: "wellness.png", content_type: "image/png")
wellness_activity.save!

memory_photo = URI.open("https://live.staticflickr.com/8289/7693260106_4feba6e327_c.jpg")

momory_activity = Activity.new(
  name: 'Memory Lane: Reminiscence Group',
  address: 'Oranienburger Str. 28, 10117 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Share and cherish your life stories with fellow seniors in a warm and supportive environment. This group session promotes memory recall and emotional connection.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: "Any memorabilia or photographs you'd like to discuss, a journal",
  category: support,
  max_count: 10,
  chatroom: Chatroom.new
  )

momory_activity.photos.attach(io: memory_photo, filename: "memory.png", content_type: "image/png")
momory_activity.save!

symposium_photo = URI.open("https://images.unsplash.com/photo-1561489396-888724a1543d?auto=format&fit=crop&q=80&w=3270&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")

symposium_activity = Activity.new(
  name: 'Supportive Caregiver Symposium',
  address: 'Luckenwalder Str. 3, 10963 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'A symposium designed for both seniors and their caregivers. Gain valuable insights, share experiences, and connect with others facing similar challenges.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Any relevant medical or caregiving documents',
  category: support,
  max_count: 10,
  chatroom: Chatroom.new
  )

symposium_activity.photos.attach(io: symposium_photo, filename: "symposium.png", content_type: "image/png")
symposium_activity.save!

meditation_photo = URI.open("https://images.unsplash.com/photo-1638497425191-d7b4828494d1?auto=format&fit=crop&q=80&w=3270&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")

meditation_activity = Activity.new(
  name: 'Peaceful Minds Meditation Gathering',
  address: 'Georgenstraße 23, 10117 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Cultivate inner peace and mindfulness with our meditation group. Relax, de-stress, and share positive energy with like-minded seniors.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Comfortable clothing, a cushion or mat for sitting, and an open, tranquil mind',
  category: wellness,
  max_count: 10,
  chatroom: Chatroom.new
  )

meditation_activity.photos.attach(io: meditation_photo, filename: "meditation.png", content_type: "image/png")
meditation_activity.save!

stretch_photo = URI.open("https://images.pexels.com/photos/6815684/pexels-photo-6815684.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")

stretch_activity = Activity.new(
  name: 'Guide to Stretch Exercises',
  address: 'Reinhardtstraße 14, 10117 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'This retreat will help you improve flexibility, balance, and overall well-being. Guided by experienced instructors.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'yoga mat, water bottle, comfortable clothing',
  category: wellness,
  max_count: 15,
  chatroom: Chatroom.new
  )

stretch_activity.photos.attach(io: stretch_photo, filename: "stretch.png", content_type: "image/png")
stretch_activity.save!

taichi_photo = URI.open("https://res.cloudinary.com/dvbboesg3/image/upload/v1698839503/seniors/Screenshot_2023-11-01_at_12.50.55_usmof3.png")

taichi_activity = Activity.new(
  name: 'Tai Chi for Seniors',
  address: 'Akazienstraße 27, 10823 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'This class will focus on gentle movements and breathing techniques to enhance balance, reduce pain, and promote a sense of calm.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Loose-fitting clothing, comfortable shoes',
  category: wellness,
  max_count: 15,
  chatroom: Chatroom.new
  )

taichi_activity.photos.attach(io: taichi_photo, filename: "taichi.png", content_type: "image/png")
taichi_activity.save!

story_photo = URI.open("https://images.pexels.com/photos/5231290/pexels-photo-5231290.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")

story_activity = Activity.new(
  name: 'Storytelling Circle',
  address: 'Voxstraße 2, 10785 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Share and listen to captivating stories from your life and experiences. This community event provides a platform to inspire one another through storytelling.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Your favorite story or memory to share',
  category: community,
  max_count: 10,
  chatroom: Chatroom.new
  )

story_activity.photos.attach(io: story_photo, filename: "story.png", content_type: "image/png")
story_activity.save!

birdwatch_photo = URI.open("https://images.unsplash.com/photo-1640624404389-13fe8e89c9c2?auto=format&fit=crop&q=80&w=3012&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")

birdwatch_activity = Activity.new(
  name: 'Birdwatching Adventure',
  address: 'Havelchaussee 61, 14193 Berlin, Germany',
  date_time: create_random_date_time,
  description: "Guided by experienced birdwatchers, you'll observe and learn about local bird species in their natural habitat.",
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Binoculars, bird guidebook, and comfortable walking shoes',
  category: outdoors,
  max_count: 10,
  chatroom: Chatroom.new
  )

birdwatch_activity.photos.attach(io: birdwatch_photo, filename: "birdwatch.png", content_type: "image/png")
birdwatch_activity.save!

picknick_photo = URI.open("https://images.unsplash.com/photo-1530062845289-9109b2c9c868?auto=format&fit=crop&q=80&w=3272&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")

pickinck_activity = Activity.new(
  name: 'Scenic Picnic by the Lake',
  address: 'Moorlakeweg 6, 14109 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Enjoy the beauty of the outdoors with a scenic picnic by the lake. Relax by the water and engage in friendly conversations with others.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Picnic basket, comfortable picnic blanket, sunscreen, and your favorite picnic snacks',
  category: outdoors,
  max_count: 10,
  chatroom: Chatroom.new
  )

pickinck_activity.photos.attach(io: picknick_photo, filename: "picknick.png", content_type: "image/png")
pickinck_activity.save!

hiking_expedition_photo = URI.open("https://res.cloudinary.com/dvbboesg3/image/upload/v1698821716/seniors/hiking.png")

hiking_expedition_activity = Activity.new(
  name: 'Hiking Expedition',
  address: 'Fercher Str. 2, 12629 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Challenge yourself with a senior-friendly hiking expedition. This guided hike will take you through scenic trails, allowing you to connect with nature and enjoy the great outdoors.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Hiking boots, water bottle, walking stick, and a sense of adventure',
  category: outdoors,
  max_count: 10,
  chatroom: Chatroom.new
  )

hiking_expedition_activity.photos.attach(io: hiking_expedition_photo, filename: "hiking.png", content_type: "image/png")
hiking_expedition_activity.save!

book_photo = URI.open("https://images.unsplash.com/photo-1528402772935-4134bc18b474?auto=format&fit=crop&q=80&w=1740&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
book_activity = Activity.new(
  name: 'Monthly Book Club',
  address: 'Pohlstraße 74, 10785 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Join our book club where you can dive into literature, discuss your favorite books, and discover new ones.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'The book of the month and your insights',
  category: learning,
  max_count: 10,
  chatroom: Chatroom.new
  )

book_activity.photos.attach(io: book_photo, filename: "book.png", content_type: "image/png")
book_activity.save!

woodwork_photo = URI.open("https://res.cloudinary.com/dvbboesg3/image/upload/v1698838899/seniors/woodwork-1.png")

woodwork_activity = Activity.new(
  name: 'Woodwork Workshop',
  address: 'Josef-Orlopp-Straße 92, 10365 Berlin, Germany',
  date_time: create_random_date_time,
  description: "You'll create your own masterpieces under the guidance of skilled art instructors.",
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Your creativity and imagination',
  category: learning,
  max_count: 10,
  chatroom: Chatroom.new
  )

woodwork_activity.photos.attach(io: woodwork_photo, filename: "woodwork.png", content_type: "image/png")
woodwork_activity.save!

pottery_photo = URI.open("https://res.cloudinary.com/dvbboesg3/image/upload/v1698835746/seniors/pottery-1.png")

pottery_activity = Activity.new(
  name: 'Pottery and Ceramics Class',
  address: 'Wollankstraße 72, 13359 Berlin, Germany',
  date_time: create_random_date_time,
  description: "Unleash your inner artist with hands-on pottery and ceramics classes. Create beautiful pottery and ceramic pieces, from mugs to sculptures.",
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'An apron and your artistic vision',
  category: arts,
  max_count: 10,
  chatroom: Chatroom.new
  )

pottery_activity.photos.attach(io: pottery_photo, filename: "pottery.png", content_type: "image/png")
pottery_activity.save!

board_photo = URI.open("https://images.pexels.com/photos/6817690/pexels-photo-6817690.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")

board_activity = Activity.new(
  name: 'Board Game Bonanza',
  address: 'Mohrenstrasse 30, 10117 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Challenge your strategic thinking and have fun with board games and puzzles.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Favorite board games or card decks',
  category: entertainment,
  max_count: 10,
  chatroom: Chatroom.new
  )

board_activity.photos.attach(io: board_photo, filename: "board.png", content_type: "image/png")
board_activity.save!

yoga_photo = URI.open("https://images.pexels.com/photos/7530582/pexels-photo-7530582.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")

yoga_activity = Activity.new(
  name: 'Holistic Health and Wellness Workshop',
  address: 'Torstrasse 1, 10119, Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Focus on your well-being with wellness workshops and health-related activities.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Comfortable clothing for yoga or meditation',
  category: wellness,
  max_count: 10,
  chatroom: Chatroom.new
  )

yoga_activity.photos.attach(io: yoga_photo, filename: "yoga.png", content_type: "image/png")
yoga_activity.save!

hobby_gathering_photo = URI.open("https://images.unsplash.com/photo-1506806732259-39c2d0268443?auto=format&fit=crop&q=80&w=2072&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")

hobby_gathering_activity = Activity.new(
  name: 'Hobby Enthusiasts Gathering',
  address: 'Nordufer 20, 13353 Berlin, Germany',
  date_time: create_random_date_time,
  description: 'Pursue your hobbies and passions with like-minded individuals.',
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'Your hobby equipment or materials',
  category: entertainment,
  max_count: 10,
  chatroom: Chatroom.new
  )

hobby_gathering_activity.photos.attach(io: hobby_gathering_photo, filename: "hobby.png", content_type: "image/png")
hobby_gathering_activity.save!

painting_photo = URI.open("https://live.staticflickr.com/3196/2285932035_7057c098cb_c.jpg")

painting_activity = Activity.new(
  name: 'Oil Painting Workshop',
  address: 'Donaustraße 16, 12043 Berlin, Germany',
  date_time: create_random_date_time,
  description: "Whether you're a seasoned painter or a beginner, this workshop is tailored to your skill level.",
  owner: users.sample,
  difficulty: rand(1..5),
  equipment: 'A smock or apron to protect your clothing',
  category: arts,
  max_count: 10,
  chatroom: Chatroom.new
  )

painting_activity.photos.attach(io: painting_photo, filename: "painting.png", content_type: "image/png")
painting_activity.save!

puts "DB created"
