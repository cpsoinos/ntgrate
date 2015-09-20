class AddPageUrlToFacebookPages < ActiveRecord::Migration
  def change
    add_column :facebook_pages, :page_url, :string
  end
end
