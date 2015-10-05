class AddPictureToSocialAccounts < ActiveRecord::Migration
  def change
    add_column :facebook_accounts, :picture, :string
    add_column :twitter_accounts, :picture, :string
    add_column :instagram_accounts, :picture, :string
  end
end
