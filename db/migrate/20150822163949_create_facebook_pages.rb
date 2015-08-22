class CreateFacebookPages < ActiveRecord::Migration
  def change
    create_table :facebook_pages do |t|
      t.integer :user_id, unique: true, null: false
      t.string :short_lived_token
      t.string :long_lived_token
    end
  end
end
