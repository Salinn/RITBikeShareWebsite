class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.integer :user_id
      t.integer :survey_id
      t.integer :score

      t.timestamps
    end
  end
end
