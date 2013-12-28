json.array!(@guest_users) do |guest_user|
  json.extract! guest_user, :id, :rit_user_id, :other_email
  json.url guest_user_url(guest_user, format: :json)
end
