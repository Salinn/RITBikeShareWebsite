class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.integer :bike_id
      t.boolean :need_repair

      t.timestamps
    end
  end
end
