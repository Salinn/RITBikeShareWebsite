class CreateCheckedOuts < ActiveRecord::Migration
  def change
    create_table :checked_outs do |t|
      t.integer :bike_user_id
      t.integer :bike_id
      t.datetime :checkout_time
      t.datetime :checkin_time
      t.boolean :fixed
      t.text :problem

      t.timestamps
    end
  end
end
