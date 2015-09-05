class AddPhotoToFacebookShares < ActiveRecord::Migration
  def change
    add_column :facebook_shares, :photo, :string
  end
end
