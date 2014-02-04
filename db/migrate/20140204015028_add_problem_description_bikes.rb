class AddProblemDescriptionBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :problem_description, :text
  end
end
