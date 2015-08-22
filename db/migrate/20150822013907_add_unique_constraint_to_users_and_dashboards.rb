class AddUniqueConstraintToUsersAndDashboards < ActiveRecord::Migration
  def change
    add_index :dashboards, :user_id, unique: true
  end
end
