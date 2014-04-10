module BikesHelper
  def number_of_bikes_left
    total__number_of_bikes = 0
    bikes = Bike.all
    bikes.each do |bike|
      total__number_of_bikes+=1 unless bike.checked_out or bike.need_repair or bike.addtional_repair_need or !bike.passed_inspection
    end
    total__number_of_bikes
  end

  def num_of_bikes_to_be_inspected
    total_number_of_bikes = 0
    bikes = Bike.all
    bikes.each do |bike|
      total_number_of_bikes+=1 if !bike.passed_inspection or bike.need_repair
    end
    total_number_of_bikes
  end
end
