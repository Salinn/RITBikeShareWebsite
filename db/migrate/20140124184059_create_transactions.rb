class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :title
      t.float :total
      t.string :status

      t.timestamps
    end
  end
end
