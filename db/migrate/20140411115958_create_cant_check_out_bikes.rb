class CreateCantCheckOutBikes < ActiveRecord::Migration
  def change
    create_table :cant_check_out_bikes do |t|
      t.integer :number_of_people_who_could_not
      t.timestamps
    end
  end
end
