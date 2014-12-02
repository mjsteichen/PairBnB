class User < ActiveRecord::Base
  validates :email, :password_digest, :name, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /.+@.+\.{1}.+/ }
  validates :password, length: { minimum: 8 }


  has_many :sent_messages, class_name: "Message", foreign_key: :sender_id
  has_many :received_messages, class_name: "Message", foreign_key: :recipient_id

  has_many :sent_shoutouts, class_name: "Shoutout", foreign_key: :sender_id
  has_many :received_shoutouts, class_name: "Shoutout", foreign_key: :recipient_id

  has_many :hosted_pairings, class_name: "Pairing", foreign_key: :host_id
  has_many :visited_pairings, class_name: "Pairing", foreign_key: :visitor_id

  has_many :residences
  has_many :availabilities, through: :residences
  has_many :residence_images, through: :residences, source: :images

  has_many :sent_requests, class_name: "Request", foreign_key: :sender_id
  has_many :received_requests, through: :residences, source: :requests

  has_secure_password
end
