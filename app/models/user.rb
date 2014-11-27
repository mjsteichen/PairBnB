class User < ActiveRecord::Base
  has_many :messages
  has_many :shoutouts
  has_many :pairings
  has_many :residences
  has_many :availabilities, through: :residences
  has_many :residence_images, through: :residences, source: :images

  has_secure_password
end
