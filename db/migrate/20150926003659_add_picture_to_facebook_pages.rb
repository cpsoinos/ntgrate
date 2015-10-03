class AddPictureToFacebookPages < ActiveRecord::Migration
  def change
    add_column :facebook_pages, :picture, :string
  end
end
