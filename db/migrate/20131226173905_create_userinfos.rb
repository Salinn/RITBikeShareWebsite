class CreateUserinfos < ActiveRecord::Migration
  def change
    create_table :userinfos do |t|
      t.string :rit_email
      t.integer :bike_checked_out
      t.boolean :admin

      t.timestamps
    end
  end
end
