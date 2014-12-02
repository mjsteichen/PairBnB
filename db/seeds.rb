# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(name: "Nick Brown", email: "nick.brown2014@gmail.com", password: "catscats", picture_url: Faker::Avatar.image(Faker::Lorem.word, "150x150"), bio: Faker::Lorem.sentences(4).join(" "), specialties: "Ruby, RoR Web sockets",github_url: "https://github.com/nick-brown2014", twitter_url: "https://twitter.com/SunnyBrownCC")

User.create!(name: "The Jabbowaki", email: "emily.owaki@gmail.com", password: "catscats", picture_url: Faker::Avatar.image(Faker::Lorem.word, "150x150"), bio: Faker::Lorem.sentences(4).join(" "), specialties: "Ruby, RoR, Bootstrap", github_url: "https://github.com/jabbowaki", twitter_url: "https://twitter.com/Jabbowaki")

User.create!(name: "Capn Steich",  email: "michael.steichen@gmail.com", password: "password", picture_url: Faker::Avatar.image(Faker::Lorem.word, "150x150"), bio: Faker::Lorem.sentences(4).join(" "), specialties: "RoR, Schemas, Postgres", github_url: "https://github.com/mjsteichen", twitter_url: "https://twitter.com/MeikSteich")

User.create!(name: "Dave Hoover", email: "dave@hoover.com", password: "catscats", picture_url: Faker::Avatar.image(Faker::Lorem.word, "150x150"), bio: Faker::Lorem.sentences(4).join(" "), specialties: "RoR, writing about apprenticeships", github_url: "https://github.com/redsquirrel/nest", twitter_url: "https://twitter.com/https://DaveHoover")

20.times do

  User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: "password", picture_url: Faker::Avatar.image(Faker::Lorem.word, "150x150"), bio: Faker::Lorem.sentences(4).join(" "), specialties: Faker::Lorem.sentence(3), github_url: Faker::Lorem.word + "github.io", twitter_url: "http://twitter.com/" + Faker::Lorem.word)

  Pairing.create!(host_id: rand(12) + 1, visitor_id: (rand(12) + 13))

  Availability.create!(residence_id: rand(24) + 1, pairing_id: rand(24) + 1, date: Faker::Date.forward(30))

  Shoutout.create!(recipient_id: rand(12) + 1, sender_id: (rand(12) + 13), text: Faker::Lorem.sentences(4).join(" "))

  Message.create!(sender_id: rand(12) + 1, recipient_id: (rand(12) + 13), text: Faker::Lorem.sentences(4).join(" "))

  Image.create!(residence_id: rand(24) + 1, url: Faker::Avatar.image(Faker::Lorem.word, "150x150"))

end
i = 0
User.all.each do |user|
  i += 1
  Residence.create!(user_id: i, city: Faker::Address.city, state: Faker::Address.state, zip_code: Faker::Address.zip, neighborhood: Faker::Address.street_name, description: Faker::Lorem.sentences(4).join(" "))
end
