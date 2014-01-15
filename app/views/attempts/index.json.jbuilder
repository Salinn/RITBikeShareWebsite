json.array!(@attempts) do |attempt|
  json.extract! attempt, :id, :user_id, :survey_id, :score
  json.url attempt_url(attempt, format: :json)
end
