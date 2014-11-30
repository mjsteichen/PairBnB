class Pairing < ActiveRecord::Base
  belongs_to :host, class_name: "User"
  belongs_to :visitor, class_name: "User"
end
