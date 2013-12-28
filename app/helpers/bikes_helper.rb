module BikesHelper
  def number_of_bikes_left
    total__number_of_bikes = 0
    @bikes = Bike.all
    @bikes.each do |bike|
      if bike.checked_out == false or bike.checked_out == nil
        total__number_of_bikes+=1
      end
    end
    total__number_of_bikes
  end
end
