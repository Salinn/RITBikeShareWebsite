class CreateOtherUsers < ActiveRecord::Migration
  def change
    create_table :other_users do |t|
      t.integer :rit_user_id
      t.string :other_email

      t.timestamps
    end
  end
end
