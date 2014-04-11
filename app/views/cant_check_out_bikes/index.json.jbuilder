json.array!(@cant_check_out_bikes) do |cant_check_out_bike|
  json.extract! cant_check_out_bike, :id
  json.url cant_check_out_bike_url(cant_check_out_bike, format: :json)
end
