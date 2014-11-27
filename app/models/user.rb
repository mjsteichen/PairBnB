class User < ActiveRecord::Base
  validates :email, :password_digest, :name, presence: true
  validates :email, uniqueness: true
  validates :email, format: /.+@.+\..+/
  validates :password_digest, length: { minimum: 8 }

  has_many :messages
  has_many :shoutouts
  has_many :pairings
  has_many :residences
  has_many :availabilities, through: :residences
  has_many :residence_images, through: :residences, source: :images

  has_secure_password
end
