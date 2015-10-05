class AddUsernameAndAccountUrlToInstagramAccounts < ActiveRecord::Migration
  def change
    add_column :instagram_accounts, :username, :string
    add_column :instagram_accounts, :account_url, :string
  end
end
