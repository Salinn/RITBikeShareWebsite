class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end

  def contact
  end

  def sign_in
  end

  def register
    @user = current_user
  end

  def account
  end

  def quiz
  end

  def home_user
  end

  def home_admin
    @checked_outs = not_cheched_in
    @can_checked_outs = can_checked_out
  end

  def reports
    @bikes = Bike.all
  end
end

def can_checked_out
  bikes = Bike.order(:bike_id).find_all_by_checked_out(false)
  bikes.each do |bike|
    bikes.delete bike if bike.need_repair
    bikes.delete bike if bike.addtional_repair_need
    bikes.delete bike unless bike.passed_inspection
  end
  bikes
end
def not_cheched_in
  CheckedOut.order(:bike_id).find_all_by_checkout_time(nil)
end