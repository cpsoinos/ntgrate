class AddDeletedAtToFacebookShares < ActiveRecord::Migration
  def change
    add_column :facebook_shares, :deleted_at, :datetime
    add_index :facebook_shares, :deleted_at
  end
end
