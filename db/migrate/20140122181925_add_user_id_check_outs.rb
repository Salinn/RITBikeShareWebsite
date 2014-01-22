class AddUserIdCheckOuts < ActiveRecord::Migration
  def change
    rename_column :checked_outs, :bike_user_id, :user_id
  end
end
