class AddDateTrackerToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :last_date_inspected, :date
  end
end
