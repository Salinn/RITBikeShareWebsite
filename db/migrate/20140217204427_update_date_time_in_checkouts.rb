class UpdateDateTimeInCheckouts < ActiveRecord::Migration
  def change
    add_column :checked_outs, :date_of_checkout, :date
    add_column :checked_outs, :date_of_checkin, :date
    add_column :checked_outs, :time_of_checkout, :time
    add_column :checked_outs, :time_of_checkin, :time
    remove_column :checked_outs, :checkout_time
    remove_column :checked_outs, :checkin_time
  end
end
