class Residence < ActiveRecord::Base
  validates :city, :state, :zip_code, presence: true

  has_many :images
  has_many :availabilities
  belongs_to :user
end
