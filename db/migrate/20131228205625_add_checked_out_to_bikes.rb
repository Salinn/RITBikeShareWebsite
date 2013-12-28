class AddCheckedOutToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :checked_out, :boolean
  end
end
