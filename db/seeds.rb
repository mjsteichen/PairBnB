# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


nick = User.create!(name: "Nick Brown", email: "nick.brown2014@gmail.com", password: "catscats", picture_url: "https://dl-web.dropbox.com/get/Wolves%202014/Nick.jpg?_subject_uid=45230430&w=AADvam2SfFcMAADmwLO2DAY07JbpVyV6wzDU_vyTbwEGhg", bio: "Hey there, I'm Nick! I am originally from Cincinatti, OH and recently came to Chicago to attend Dev BootCamp (GO WOLVES!). I enjoy practing yoga, coding, and hanging out with friends. You should message me if you're in the Cincinatti area and need a couch to crash on.", specialties: "Ruby, JavaScript, RoR, Web sockets",github_url: "nick-brown2014", twitter_url: "SunnyBrownCC")

nicks_place = nick.residences.create!(user_id: 1, city: "Cincinatti", state: "OH", zip_code: "79351", neighborhood: "the cool district", description: "I live in a spacious apartment with two great roommates. We love having guests. I've heard we have the most comfortable futon on this side of the Mississippi!" )

nicks_apartment_pic = Image.create!(residence_id: 1, url: "http://www.distroarchitecture.com/wp-content/uploads/2011/06/Fabulous-And-Impressive-Built-In-Library-Concept-of-Nate-Berkus-Chicago-Apartment-With-Comfortable-White-Sofa.jpg")

emily = User.create!(name: "Emily Owaki", email: "emily.owaki@gmail.com", password: "catscats", picture_url: "http://40.media.tumblr.com/6e814d2ce419ff677f29db03fdf9da12/tumblr_n6pmeqqOVl1s9dt9so1_1280.png", bio: "Hi there, I'm Emily Owaki! I grew up in Connecticut and moved to Chicago about eight years ago. I recently graduated from Dev BootCamp. In my free time, I like to bike, knit, pet cats, and go to tech events in the Chicago area. PairBnB is awesome, so you should message me if you're in the Chicago area and need a couch to crash on.", specialties: "Ruby, RoR, Bootstrap", github_url: "jabbowaki", twitter_url: "Jabbowaki")

emilys_place = emily.residences.create!(user_id: 2, city: "Chicago", state: "IL", zip_code: "60600", neighborhood: "Loop", description: "My place is nestled in Chicago's bustling downtown. Really close to all forms of public transportation and countless entertainment options. My boyfriend and I love it! If you crash at our place you'll be staying on a couch-- most likely with our cat, Mr. Whiskers" )

emilys_apartment_pic = Image.create!(residence_id: 2, url: "")

michael = User.create!(name: "Michael Steichen",  email: "michael.steichen@gmail.com", password: "password", picture_url: "https://dl-web.dropbox.com/get/Wolves%202014/Michael%20S..jpg?_subject_uid=45230430&w=AACI3-IJNHXfaZfrVK5lITx6sFmLf8hKd0s63Rz4PuZQ6g", bio: "Hi hello! My friends call me 'mikesteich' cause it rhymes that way. I grew up in Tulsa, Oklahoma and moved to Chicago in 2006. Before I arrived at Dev Bootcamp, I was working in Chicago's specialty coffee scene as a trainer and quality controller. Let's pair sometime!", specialties: "RoR, Schemas, Postgres, Brewing Coffee", github_url: "mjsteichen", twitter_url: "MeikSteich")

michaels_place = michael.residences.create!(user_id: 3, city: "Chicago", state: "IL", zip_code: "60647", neighborhood: "Logan Square", description: "My home is a spacious apartment with two great roommates. We live in Logan Square, right off the blue line with easy access to O'Hare. We love spoiling our guests with homemade biscuits and tasty coffee. If you crash at our place, you'll be sleeping on a sofa bed in the living room. There's quite a bit of street noise so ear plugs are a good idea. :)")

michaels_apartment_pic = Image.create!(residence_id: 3, url: "http://media-cache-ec0.pinimg.com/736x/a8/dc/07/a8dc070e55edf45a6a8a6b8159a104b2.jpg")

dave = User.create!(name: "Dave Hoover", email: "dave@hoover.com", password: "password", picture_url: "https://pbs.twimg.com/profile_images/3596476760/79cb669130fb93ba6844d367fa85b385.png", bio: "Hola, I'm Dave Hoover. I started DBC Chicago a little over two years ago and I love it. I'm here because latent human potential pisses me off. When I'm not at DBC, I enjoy spending time with my family and reading. PairBnB is awesome, so you should message me if you're in the Chicago area and need a couch to crash on. I've got a couple projects that could use an extra set of eyes.", specialties: "Reimaging computers, RoR, Apprenticeship Patterns", github_url: "redsquirrel/nest", twitter_url: "DaveHoover")

daves_place = dave.residences.create!(user_id: 4, city: "Chicago", state: "IL", zip_code: "60647", neighborhood: "The best neighborhood", description: "My family and I would love to host any programmers who find themselves in Chicago. We have a guest bedroom with a full-size bed that has your name on it. Continental breakfast included! What a deal!")

daves_apartment_pic = Image.create!(residence_id: 4, url: "http://images.freshnessmag.com/wp-content/uploads//2011/07/daves-wear-house-dave-ortiz-02.jpg")

nate = User.create!(name: "Nate Delage", email: "nate@nate.com", password: "password", picture_url: "https://pbs.twimg.com/profile_images/481111351826186243/JX107zo1_400x400.jpeg", bio: "I'm Nate Delage and I'm an instructor at Dev BootCamp. I've been a developer for over a decade and find teaching new developers very fulfilling. My hobbies include swimming, photography, and baking bread. PairBnB is awesome, so you should message me if you're in the Chicago area and need a couch to crash on. I've got a couple projects that could use an extra set of eyes.", specialties: "RoR, JavaScript, Ruby, Vacuuming", github_url: "ndelage", twitter_url: "natedelage")

nates_place = nate.residences.create!(user_id: 5, city: "Chicago", state: "IL", zip_code: "60660", neighborhood: "Lakeview", description: "My wife and I love hosting guests in our spacious Lakeview apartment. As the name implies, we're very close to Lake Michigan-- that provides for some beautiful sunrises. I love baking bread so if you're scared of carbs, stay away. We have a fold-out couch that is very comfortable. Message me if you're in the area!")

nates_apartment_pic = Image.create!(residence_id: 5, url: "http://www.themanlyhousekeeper.com/wp-content/uploads/2011/07/apartmentcleaning-vacuum.jpg")

###########################################
############## Faker Seeds ################
###########################################

# Residence.create!(user_id: i, city: Faker::Address.city, state: Faker::Address.state, zip_code: Faker::Address.zip, neighborhood: Faker::Address.street_name, description: Faker::Lorem.sentences(4).join(" "))

# 20.times do

#   User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: "password", picture_url: Faker::Avatar.image(Faker::Lorem.word, "150x150"), bio: Faker::Lorem.sentences(4).join(" "), specialties: Faker::Lorem.sentence(3), github_url: Faker::Lorem.word + "github.io", twitter_url: "http://twitter.com/" + Faker::Lorem.word)

#   Pairing.create!(host_id: rand(12) + 1, visitor_id: (rand(12) + 13))

#   Availability.create!(residence_id: rand(24) + 1, pairing_id: rand(24) + 1, date: Faker::Date.forward(30))

#   Shoutout.create!(recipient_id: rand(12) + 1, sender_id: (rand(12) + 13), text: "They are so great to pair with! The sofa is super comfy, and they have a hot tub!")

#   Message.create!(sender_id: rand(12) + 1, recipient_id: (rand(12) + 13), text: Faker::Lorem.sentences(4).join(" "))

#   Image.create!(residence_id: rand(24) + 1, url: Faker::Avatar.image(Faker::Lorem.word, "150x150"))

# end
# i = 0
# User.all.each do |user|
#   i += 1
#   Residence.create!(user_id: i, city: Faker::Address.city, state: Faker::Address.state, zip_code: Faker::Address.zip, neighborhood: Faker::Address.street_name, description: Faker::Lorem.sentences(4).join(" "))
# end
