class UserMailer < ActionMailer::Base
  default from: "sgnoreply@rit.edu"

  def registration_confirmation
    mail(:to => current_user.email, :subject => "Registered")
  end

  def over_time_limit user
    @user = user
    mail(:to => @user.email, :subject => "Please Return Your Bike!")
  end

  def feed_back_email feedback, current_user
    @feedback = feedback
    @user = current_user
    mail(:to => "sgpres@rit.edu", :subject => "New Feedback")
  end
end
