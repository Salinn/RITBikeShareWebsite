module CheckedOutsHelper
  def not_cheched_in
    CheckedOut.order(:bike_id).find_all_by_checkin_time(nil)
  end
end
