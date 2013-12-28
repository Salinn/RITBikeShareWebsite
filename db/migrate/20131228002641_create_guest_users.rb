class CreateGuestUsers < ActiveRecord::Migration
  def change
    create_table :guest_users do |t|
      t.integer :rit_user_id
      t.string :other_email

      t.timestamps
    end
  end
end
