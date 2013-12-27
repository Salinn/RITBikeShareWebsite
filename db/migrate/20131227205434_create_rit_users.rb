class CreateRitUsers < ActiveRecord::Migration
  def change
    create_table :rit_users do |t|
      t.integer :user_id
      t.string :rit_email
      t.boolean :admin

      t.timestamps
    end
  end
end
