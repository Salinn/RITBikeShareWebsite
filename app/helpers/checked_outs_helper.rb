module CheckedOutsHelper
  def not_cheched_in
    CheckedOut.order(:bike_id).find_all_by_time_of_checkin(nil)
  end
end
