require File.expand_path(File.dirname(__FILE__) + "/environment")

every 1.hour do
  @user = User.find(1)
  UserMailer.test(@user).deliver
end

every 5.minute do
  @user = User.find(1)
  UserMailer.deliver_over_time_limit(@user)

end

