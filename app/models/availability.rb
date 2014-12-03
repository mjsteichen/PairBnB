class Availability < ActiveRecord::Base
  belongs_to :residence
  belongs_to :pairing

  def day
    self.date.last(2)
  end
end
