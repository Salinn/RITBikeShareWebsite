class Bike < ActiveRecord::Base
  validates :bike_id,  presence: true, uniqueness: Bike

  belongs_to :user
  belongs_to :checked_out
  belongs_to :maintenance_report
end
