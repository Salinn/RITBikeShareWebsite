class UserMailer < ActionMailer::Base
  default from: "sgpres@rit.edu"

  def registration_confirmation
    mail(:to => current_user.email, :subject => "Registered")
  end

  def over_time_limit
    mail(:to => current_user.email, :subject => "Registered")
  end

  def test user
    @user = user
    mail(:to => @user.email, :subject => "Test")
  end
end
