class AddDeletedAtToTables < ActiveRecord::Migration
  def change
    add_column :dashboards, :deleted_at, :datetime
    add_index :dashboards, :deleted_at

    add_column :facebook_accounts, :deleted_at, :datetime
    add_index :facebook_accounts, :deleted_at

    add_column :facebook_pages, :deleted_at, :datetime
    add_index :facebook_pages, :deleted_at

    add_column :identities, :deleted_at, :datetime
    add_index :identities, :deleted_at

    add_column :instagram_accounts, :deleted_at, :datetime
    add_index :instagram_accounts, :deleted_at

    add_column :listings, :deleted_at, :datetime
    add_index :listings, :deleted_at

    add_column :twitter_accounts, :deleted_at, :datetime
    add_index :twitter_accounts, :deleted_at

    add_column :users, :deleted_at, :datetime
    add_index :users, :deleted_at
  end
end
