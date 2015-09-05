class AddShareTypeToFacebookShares < ActiveRecord::Migration
  def change
    add_column :facebook_shares, :share_type, :string
  end
end
