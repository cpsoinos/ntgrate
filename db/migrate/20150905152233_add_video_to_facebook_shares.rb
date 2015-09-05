class AddVideoToFacebookShares < ActiveRecord::Migration
  def change
    add_column :facebook_shares, :video, :string
  end
end
