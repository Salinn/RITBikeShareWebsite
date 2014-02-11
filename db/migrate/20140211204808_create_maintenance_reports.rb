class CreateMaintenanceReports < ActiveRecord::Migration
  def change
    create_table :maintenance_reports do |t|
      t.integer :user_id
      t.integer :bike_id
      t.text    :report
      t.text    :problem_before_maintenance

      t.timestamps
    end
  end
end
