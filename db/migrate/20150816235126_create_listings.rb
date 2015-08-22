class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :address
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.money :asking_price
      t.money :sold_for
      t.bigint :mls_number, unique: true
      t.date :listed_at
      t.date :sold_at
      t.string :status, null: false
      t.text :description
      t.float :bedrooms
      t.float :bathrooms
      t.integer :built
      t.string :listing_type
      t.boolean :pets_allowed
      t.integer :square_feet
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
