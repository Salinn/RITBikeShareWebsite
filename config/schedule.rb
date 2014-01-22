require File.expand_path(File.dirname(__FILE__) + "/environment")

every 1.minute do
  CheckedOut.all.each do |checkout|
    if checkout.checkin_time.nil? && checkout.checkout_time
      runner "UserMailer..test(User.find(checkout.bike_user_id)).deliver"
    end
  end
end

