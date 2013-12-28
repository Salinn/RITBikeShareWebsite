json.array!(@checked_outs) do |checked_out|
  json.extract! checked_out, :id, :bike_user_id, :bike_id, :checkout_time, :checkin_time, :fixed, :problem
  json.url checked_out_url(checked_out, format: :json)
end
