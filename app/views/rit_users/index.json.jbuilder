json.array!(@rit_users) do |rit_user|
  json.extract! rit_user, :id, :user_id, :rit_email, :admin
  json.url rit_user_url(rit_user, format: :json)
end
