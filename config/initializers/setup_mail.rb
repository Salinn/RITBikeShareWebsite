ActionMailer::Base.smtp_settings = {
    :address              => "mymail.ad.rit.edu",
    :port                 => 587,
    :authentication       => :login,
    :user_name            => "sgnoreply@main.ad.rit.edu",
    :password             => "Tiger244",
    :enable_starttls_auto =>  true,
}
