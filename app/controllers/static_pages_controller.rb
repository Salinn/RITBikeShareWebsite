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
  can_checked_outs = Bike.order(:bike_id).find_all_by_checked_out(false)
  can_checked_outs.each do |check_out|
    if check_out.need_repair or check_out.addtional_repair_need or check_out.passed_inspection == false
      can_checked_outs.delete check_out
    end
  end

end
def not_cheched_in
  CheckedOut.order(:bike_id).find_all_by_time_of_checkin(nil)
end