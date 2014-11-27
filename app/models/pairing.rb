class Pairing < ActiveRecord::Base
  belongs_to :host, class_name: "User", foreign_key: "user_id"
  belongs_to :visitor, class_name: "User", foreign_key: "user_id"
end
