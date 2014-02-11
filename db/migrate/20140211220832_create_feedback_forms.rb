class CreateFeedbackForms < ActiveRecord::Migration
  def change
    create_table :feedback_forms do |t|
      t.text :feedback

      t.timestamps
    end
  end
end
