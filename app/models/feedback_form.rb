class FeedbackForm < ActiveRecord::Base
  validates :feedback, :presence => { :message => "Please Enter Something In The Feedback Form" }
end
