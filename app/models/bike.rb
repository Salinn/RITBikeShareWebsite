class Bike < ActiveRecord::Base
  validates :bike_id,  presence: true, uniqueness: Bike

end
