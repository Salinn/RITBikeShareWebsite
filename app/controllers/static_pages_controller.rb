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
  Bike.order(:bike_id).where(need_repair: false, addtional_repair_need: false, checked_out: false, passed_inspection: true)
end
def not_cheched_in
  CheckedOut.order(:bike_id).find_all_by_checkin_time(nil)
end