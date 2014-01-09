require File.expand_path(File.dirname(__FILE__) + "/environment")

every 1.minutes do
  @user = User.find(1)
  UserMailer.test(@user).deliver
end

