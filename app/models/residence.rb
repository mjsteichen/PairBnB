class Residence < ActiveRecord::Base
  has_many :images
  has_many :availabilities
  belongs_to :user
end
