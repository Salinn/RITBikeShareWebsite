class AddRepairmanAndCheckoutPersonUsers < ActiveRecord::Migration
  def change
    add_column :users, :repairman, :boolean
    add_column :users, :checkout_person, :boolean
  end
end
