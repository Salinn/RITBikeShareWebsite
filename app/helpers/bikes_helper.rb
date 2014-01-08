module BikesHelper
  def number_of_bikes_left
    total__number_of_bikes = 0
    @bikes = Bike.all
    @bikes.each do |bike|
      total__number_of_bikes += 1 unless bike.checked_out
    end
    total__number_of_bikes
  end
end
