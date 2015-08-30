class CreateFacebookShares < ActiveRecord::Migration
  def change
    create_table :facebook_shares do |t|
      t.text :content
      t.string :link
      t.string :share_url
      t.string :share_id
      t.timestamps
      t.references :facebook_account
    end
  end
end
