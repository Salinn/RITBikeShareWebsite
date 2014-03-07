class AddDueDateToBikesAndCheckouts < ActiveRecord::Migration
  def change
    add_column :checked_outs, :due_back, :datetime
    add_column :bikes, :next_date_inspected, :date
  end
end
