require 'open-uri'
require 'resolv-replace'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying users"
Consultation.destroy_all
User.destroy_all
puts "Creating users"
10.times do
  location = ["Yokohama", "Tokyo", "Osaka", "Kyoto", "Nagoya", "Fukuoka"].sample
  specialty = ["IT", "Film", "Marketing", "Cooking", "UX Design"].sample
  status = ["Employeed", "Unemployeed", "Student", "Intern"].sample
  file = URI.open("https://source.unsplash.com/1600x900/?#{specialty}")
  user = User.new(
    name: Faker::Name.name,
    bio: Faker::Educator.university,
    email: Faker::Internet.email,
    password: "password",
    location: location,
    speciality: specialty,
    # status: status
    )
  user.avatar.attach(io: file, filename: 'avatar.png', content_type: 'image/png')
  user.save!
  title = ["Job search", "Interview tips", "Contract negotiation", "Surprise"].sample
  description = ["With 10+ years of experience in the field, I'm familiar with the in's and out's
    of the HR process and can advise you on the best way to get interviews and pass them for a smooth
      application journey", "It is important to understand your own value and an organization's marginal
      value when negotiating compensation. I’ll provide expert advice on ways for demonstrating your worth
      and successfully negotiating for pay increases based on your achievements.", "I’ll go over the 5 do’s
        and don’ts of interviewing and guide you on how to best answer interview questions giving the the
        confidence to stand out.", "Get the inside track on how to convert an office friendship into an office
        romance!", "If you are stuck in a job you hate, I can definitely help you ditch your company and find,
        and employer who will respect and value your service and achievements. Tell your boss that he/she can
        take his/her job and shove it! You are valuable and you matter!"].sample
  price = [25, 40, 60].sample
  duration = [30, 60, 90].sample

  consultation = Consultation.new(
    title: title,
    description: description,
    price: price,
    duration: duration
    )
  consultation.user = user
  consultation.save!
  puts "Consulation #{consultation.id} for user #{user.name} created"

  date_time = ["12/07/2021", "12/08/2021", "12/09/2021"].sample
  status = [0, 1, 2].sample

  booking = Booking.new(
    date_time: date_time,
    status: status
  )

  booking.user = user
  booking.consultation = consultation
  booking.save!
  puts "Booking #{booking.id} for user #{user.name} created"

end
