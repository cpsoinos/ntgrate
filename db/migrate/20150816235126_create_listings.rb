class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :address
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.integer :asking_price
      t.integer :mls_number
      t.date :date_listed
      t.timestamps
    end
  end
end
