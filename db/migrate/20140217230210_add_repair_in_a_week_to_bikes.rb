class AddRepairInAWeekToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :passed_inspection, :boolean
    add_column :bikes, :addtional_repair_need, :boolean
  end
end
