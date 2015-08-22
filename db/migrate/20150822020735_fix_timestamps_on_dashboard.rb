class FixTimestampsOnDashboard < ActiveRecord::Migration
  def change
    remove_column :dashboards, :timestamps, :string
    add_column :dashboards, :created_at, :datetime
    add_column :dashboards, :updated_at, :datetime
  end
end
