module UsersHelper
  def time_bike_is_due_in
    start_time = @checked_out.checkin_time.
    end_time = Time.current
    elapsed_seconds = ((end_time - start_time) * 24 * 60 * 60).to_i
  end
end
