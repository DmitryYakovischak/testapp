class ChangeColumnIndexToPosition < ActiveRecord::Migration
  def change
  	rename_column :users, :index, :position
  end
end
