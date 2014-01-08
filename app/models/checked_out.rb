class CheckedOut < ActiveRecord::Base
  has_many :bikes
  has_many :users
end
