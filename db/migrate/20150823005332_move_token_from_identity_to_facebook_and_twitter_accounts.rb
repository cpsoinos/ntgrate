class MoveTokenFromIdentityToFacebookAndTwitterAccounts < ActiveRecord::Migration
  def change
    remove_column :identities, :token, :string

    create_table :twitter_accounts do |t|
      t.references :identity
      t.string :token, null: false
      t.string :secret, null: false
      t.string :handle, null: false, unique: true
      t.string :uid, null: false
      t.timestamps
    end

    create_table :facebook_accounts do |t|
      t.references :identity
      t.string :token, null: false
      t.string :uid, null: false
      t.timestamps
    end
  end
end
