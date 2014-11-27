class Availability < ActiveRecord::Base
  belongs_to :residence
  belongs_to :pairing
end
