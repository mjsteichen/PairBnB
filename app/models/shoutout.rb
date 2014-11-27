class Shoutout < ActiveRecord::Base
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  belongs_to :visitor, class_name: "User", foreign_key: "user_id"
end
