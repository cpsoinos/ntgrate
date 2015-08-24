class CreateInstagramAccount < ActiveRecord::Migration
  def change
    create_table :instagram_accounts do |t|
      t.references :identity, index: true, foreign_key: true, null: false
      t.string :uid, null: false, unique: true
      t.string :token, null: false
      t.timestamps
    end
  end
end
