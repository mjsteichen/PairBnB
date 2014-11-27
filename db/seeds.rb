# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(name: "Nick Brown", email: "nick.brown2014@gmail.com", password: "catscats", picture_url: Faker::Avatar.image("150x150"), bio: Faker::Lorem.paragraph, github_url: "https://github.com/nick-brown2014", twitter_url: "https://twitter.com/SunnyBrownCC")

User.create!(name: "The Jabbowaki", email: "emily.owaki@gmail.com", password: "catscats", picture_url: Faker::Avatar.image("150x150"), bio: Faker::Lorem.paragraph, github_url: "https://github.com/jabbowaki", twitter_url: "https://twitter.com/Jabbowaki")

User.create!(name: "Capn Steich",  email: "michael.steichen@gmail.com", password: "password", picture_url: Faker::Avatar.image("150x150"), bio: Faker::Lorem.paragraph, github_url: "https://github.com/mjsteichen", twitter_url: "https://twitter.com/MeikSteich")

User.create!(name: "Dave Hoover", email: "dave@hoover.com", password: "catscats", picture_url: Faker::Avatar.image("150x150"), bio: Faker::Lorem.paragraph, github_url: "https://github.com/redsquirrel/nest", twitter_url: "https://twitter.com/https://DaveHoover")

20.times do

  User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: "password", picture_url: Faker::Avatar.image("150x150"), bio: Faker::Lorem.paragraph, github_url: Faker::Lorem.word + "github.io", twitter_url: "http://twitter.com/" + Faker::Lorem.word)

  Residence.create!(user_id: rand(24) + 1, city: Faker::Address.city, state: Faker::Address.state, zip_code: Faker::Address.zip, description: Faker::Lorem.paragraph)

  Pairing.create!(host_id: rand(12) + 1, visitor_id: (rand(12) + 13))

  Availability.create!(residence_id: rand(24) + 1, pairing_id: rand(24) + 1, date: Faker::Date.forward(30))

  Shoutout.create!(host_id: rand(12) + 1, visitor_id: (rand(12) + 13), text: Faker::Lorem.paragraph)

  Message.create!(sender_id: rand(12) + 1, recipient_id: (rand(12) + 13), text: Faker::Lorem.paragraph)

  Image.create!(residence_id: rand(24) + 1)

end

Residence.all.each do |residence|
  residence.images.create!
end
