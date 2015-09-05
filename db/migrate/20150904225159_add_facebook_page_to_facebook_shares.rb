class AddFacebookPageToFacebookShares < ActiveRecord::Migration
  def change
    add_reference :facebook_shares, :facebook_page, index: true, foreign_key: true

    remove_column :facebook_shares, :facebook_account_id, :integer
  end
end
