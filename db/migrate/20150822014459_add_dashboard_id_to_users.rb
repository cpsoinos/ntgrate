class AddDashboardIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dashboard_id, :integer, unique: true
    add_index :users, :dashboard_id, unique: true
  end
end
