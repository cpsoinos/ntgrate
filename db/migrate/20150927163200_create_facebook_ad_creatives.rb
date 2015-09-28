class CreateFacebookAdCreatives < ActiveRecord::Migration
  def change
    create_table :facebook_ad_creatives do |t|
      t.string :name
      t.string :object_story_id
      t.string :share_id
      t.string :creative_id
      t.references :facebook_share, index: true, foreign_key: true
      t.timestamps
    end
  end
end
