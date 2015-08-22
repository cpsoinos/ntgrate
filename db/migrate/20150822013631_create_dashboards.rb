class CreateDashboards < ActiveRecord::Migration
  def change
    create_table :dashboards do |t|
      t.integer :user_id, null: false
      t.string :timestamps
    end
  end
end
