class Shoutout < ActiveRecord::Base
  validates :host_id, :visitor_id, :text, presence: true

  belongs_to :user, class_name: "User", foreign_key: "user_id"
  belongs_to :visitor, class_name: "User", foreign_key: "user_id"
end
