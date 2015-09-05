class CreateFacebookPages < ActiveRecord::Migration
  def change
    create_table :facebook_pages do |t|
      t.string :name, null: false
      t.string :uid, null: false
      t.string :category
      t.string :token, null: false
      t.references :facebook_account, index: true, foreign_key: true
    end
  end
end
