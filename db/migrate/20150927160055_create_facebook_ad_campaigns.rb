class CreateFacebookAdCampaigns < ActiveRecord::Migration
  def change
    create_table :facebook_ad_campaigns do |t|
      t.string :ad_campaign_id
      t.string :name
      t.string :objective
      t.string :ad_account_id
      t.datetime :start_time
      t.datetime :stop_time
      t.money :spend_cap
      t.timestamps
    end
  end
end
