class Shoutout < ActiveRecord::Base
  validates :recipient_id, :sender_id, :text, presence: true

  belongs_to :recipient, class_name: "User"
  belongs_to :sender, class_name: "User"

end
