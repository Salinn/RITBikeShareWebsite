json.array!(@userinfos) do |userinfo|
  json.extract! userinfo, :id, :rit_email, :bike_checked_out, :admin
  json.url userinfo_url(userinfo, format: :json)
end
