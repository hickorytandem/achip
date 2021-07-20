require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating users"
10.times do
  location = ["Yokohama", "Tokyo", "Osaka", "Kyoto", "Nagoya", "Fukuoka"].sample
  specialty = ["IT", "Media", "Sales", "Editing", "UX Design"].sample
  status = ["Employeed", "Unemployeed", "Student", "Intern"].sample
  file = URI.open("https://source.unsplash.com/1600x900/?#{specialty}")
  user = User.new(
    name: Faker::Name.name,
    bio: Faker::Educator.university,
    location: location,
    speciality: specialty,
    status: status
    )
  user.avatar.attach(io: file, filename: 'avatar.png', content_type: 'image/png')
  user.save!
  title = ["Job search", "Interview tips", "Contract negotiation", "Surprise"].sample
  description = ["This is a super great consultation and you will eat chocolate and get fat!"].sample
  price = [25, 40, 60].sample
  time = [30, 60, 90].sample
  consultation = Consultation.new(
    title: title,
    description: description,
    price: price,
    time: time
    )
  consultation.user = user
  consultation.save!
  puts "Consulation #{consulation.id} for user #{user.name} created"
end
