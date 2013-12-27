json.array!(@bikes) do |bike|
  json.extract! bike, :id, :bike_id, :need_repair
  json.url bike_url(bike, format: :json)
end
