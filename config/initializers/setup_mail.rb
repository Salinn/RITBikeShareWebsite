ActionMailer::Base.smtp_settings = {
  :address              => "mymail.ad.rit.edu",
  :port                 => 587,
  :domain               => :login,
  :user_name            => "sgpres@main.ad.rit.edu",
  :password             => ENV["SGNOREPLY"],
  :enable_starttls_auto => true
}

