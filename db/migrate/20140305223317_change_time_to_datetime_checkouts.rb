class ChangeTimeToDatetimeCheckouts < ActiveRecord::Migration
  def change
    remove_column :checked_outs, :time_of_checkin
#    remove_column :checked_outs, :time_of_checkin
#    add_column :checked_outs, :checkin_time, :datetime
    add_column :checked_outs, :checkout_time, :datetime
  end
end
