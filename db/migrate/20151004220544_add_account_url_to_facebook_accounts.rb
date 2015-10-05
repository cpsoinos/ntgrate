class AddAccountUrlToFacebookAccounts < ActiveRecord::Migration
  def change
    add_column :facebook_accounts, :account_url, :string
  end
end
