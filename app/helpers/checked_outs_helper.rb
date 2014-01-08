module CheckedOutsHelper
  def not_cheched_in
    CheckedOut.find_all_by_checkin_time(nil)
  end
end
