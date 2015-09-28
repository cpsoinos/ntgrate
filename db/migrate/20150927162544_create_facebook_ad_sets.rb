class CreateFacebookAdSets < ActiveRecord::Migration
  def change
    create_table :facebook_ad_sets do |t|
      t.string :ad_set_id
      t.string :ad_account_id
      t.integer :bid_amount
      t.string :billing_event
      t.datetime :start_time
      t.datetime :end_time
      t.string :name
      t.string :optimization_goal
      t.money :lifetime_budget
      t.money :daily_budget
      t.string :promoted_object_id
      t.boolean :is_autobid
      t.references :facebook_ad_campaign, index: true, foreign_key: true
      t.timestamps
    end
  end
end
