json.array!(@other_users) do |other_user|
  json.extract! other_user, :id, :rit_user_id, :other_email
  json.url other_user_url(other_user, format: :json)
end
