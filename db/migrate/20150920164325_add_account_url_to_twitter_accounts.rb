class AddAccountUrlToTwitterAccounts < ActiveRecord::Migration
  def change
    add_column :twitter_accounts, :account_url, :string
  end
end
