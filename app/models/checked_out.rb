class CheckedOut < ActiveRecord::Base
  has_many :bikes
  belongs_to :user
end
