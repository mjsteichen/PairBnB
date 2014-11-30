class Pairing < ActiveRecord::Base
  validates :host_id, :visitor_id, presence: true

  belongs_to :host, class_name: "User"
  belongs_to :visitor, class_name: "User"
end
