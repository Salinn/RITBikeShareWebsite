class AddAddtionalRepairNeedToMaintenanceReports < ActiveRecord::Migration
  def change
    add_column :maintenance_reports, :addtional_repair_need, :boolean
  end
end
