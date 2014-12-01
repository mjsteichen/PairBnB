class Residence < ActiveRecord::Base
  validates :city, :state, :zip_code, presence: true

  has_many :images
  has_many :availabilities
  has_many :requests

  belongs_to :user


  def self.search(search)
    search.capitalize!
    if search.present?
      where('city LIKE ?', "%#{search}%")
    else
      where(true)
    end
  end

end
