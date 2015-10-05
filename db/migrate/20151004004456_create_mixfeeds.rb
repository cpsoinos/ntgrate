class CreateMixfeeds < ActiveRecord::Migration
  def change
    create_table :mixfeeds do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.timestamps
      t.datetime :deleted_at
    end

    add_index :mixfeeds, :deleted_at
  end
end
