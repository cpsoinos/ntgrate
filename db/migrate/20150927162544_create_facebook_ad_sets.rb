class CreateFacebookAdSets < ActiveRecord::Migration
  def change
    create_table :facebook_ad_sets do |t|
      t.string :ad_set_id
      t.string :ad_account_id
      t.monetize :bid_amount, allow_nil: true
      t.string :billing_event
      t.datetime :start_time
      t.datetime :stop_time
      t.string :name
      t.string :optimization_goal
      t.monetize :lifetime_budget
      t.monetize :daily_budget
      t.string :promoted_object_id
      t.boolean :is_autobid
      t.references :facebook_ad_campaign, index: true, foreign_key: true
      t.timestamps
    end
  end
end
