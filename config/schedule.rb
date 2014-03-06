every :hour do
  runner UserMailer.over_time_limit(User.find(1)).deliver
end

