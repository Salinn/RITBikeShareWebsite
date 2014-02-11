class CheckedOut < ActiveRecord::Base
  has_many :bikes
  belongs_to :user

  validates :user_id, :presence => { :message => "User account cannot be found, please double check spelling or
                                                  make sure account has been created" }
  validates :bike_id, :presence => { :message => "A bike number needs to be inputed to be checked out" }
  validate :user_not_checked_out, :on => :create
  validate :check_if_bike_needs_repair, :on => :create

  private

  def user_not_checked_out
    current_check_outs = CheckedOut.order(:bike_id).find_all_by_checkin_time(nil)

    current_check_outs.each do |check_out|
      if check_out.user == self.user
        self.errors.add(:base, "User has already checked out a bike")
        return false
      elsif check_out.bike_id == self.bike_id
        self.errors.add(:base, "Bike has already been checked out")
        return false
      end
    end

    true
  end

  def check_if_bike_needs_repair
    bike = Bike.find_by_bike_id(bike_id)
    if bike.need_repair?
      self.errors.add(:base, "That bike is being repaired")
      return false
    end

    true
  end
end
