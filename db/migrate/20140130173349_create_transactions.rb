class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :date_of_charge
      t.float :charge_amount
      t.string :description_of_charge
      t.boolean :pending
      t.integer :user_id

      t.timestamps
    end
  end
end
