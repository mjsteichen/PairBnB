class User < ActiveRecord::Base
  validates :email, :password_digest, :name, presence: true
  validates :email, uniqueness: true
  validates :email, format: /.+@.+\..+/
  validates :password_digest, length: { minimum: 8 }

  has_many :sent_messages, source: :messages, foreign_key: :sender_id
  has_many :received_messages, source: :messages, foreign_key: :recipient_id
  has_many :sent_shoutouts, source: :shoutouts, foreign_key: :host_id
  has_many :received_shoutouts, source: :shoutouts, foreign_key: :visitor_id
  has_many :hosted_pairings, source: :pairings, foreign_key: :host_id
  has_many :visited_pairings, source: :pairings, foreign_key: :visitor_id
  has_many :residences
  has_many :availabilities, through: :residences
  has_many :residence_images, through: :residences, source: :images

  has_secure_password
end
