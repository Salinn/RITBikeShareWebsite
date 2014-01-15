class Attempt < ActiveRecord::Base
  has_many :surveys
  belongs_to :user
end
