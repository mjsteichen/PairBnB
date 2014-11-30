class Residence < ActiveRecord::Base
  validates :city, :state, :zip_code, presence: true

  has_many :images
  has_many :availabilities
  belongs_to :user
end

def self.search(search)
  search.capitalize!
  if search.present?
    where('city LIKE ?', "%#{search}%")
  else
    where(true)
  end
end
