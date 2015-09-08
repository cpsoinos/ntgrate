class CreateTwitterShares < ActiveRecord::Migration
  def change
    create_table :twitter_shares do |t|
      t.string :content
      t.string :link
      t.string :share_url
      t.string :share_id
      t.string :share_type
      t.string :photo
      t.string :video
      t.timestamps
      t.datetime :deleted_at, index: true
      t.references :twitter_account, index: true, foreign_key: true
    end
  end
end
