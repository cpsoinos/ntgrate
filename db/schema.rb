# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150905152233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dashboards", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "dashboards", ["deleted_at"], name: "index_dashboards_on_deleted_at", using: :btree
  add_index "dashboards", ["user_id"], name: "index_dashboards_on_user_id", unique: true, using: :btree

  create_table "facebook_accounts", force: :cascade do |t|
    t.integer  "identity_id", null: false
    t.string   "token",       null: false
    t.string   "uid",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "facebook_accounts", ["deleted_at"], name: "index_facebook_accounts_on_deleted_at", using: :btree
  add_index "facebook_accounts", ["identity_id"], name: "index_facebook_accounts_on_identity_id", using: :btree

  create_table "facebook_pages", force: :cascade do |t|
    t.string   "name",                null: false
    t.string   "uid",                 null: false
    t.string   "category"
    t.string   "token",               null: false
    t.integer  "facebook_account_id"
    t.datetime "deleted_at"
  end

  add_index "facebook_pages", ["deleted_at"], name: "index_facebook_pages_on_deleted_at", using: :btree
  add_index "facebook_pages", ["facebook_account_id"], name: "index_facebook_pages_on_facebook_account_id", using: :btree

  create_table "facebook_shares", force: :cascade do |t|
    t.text     "content"
    t.string   "link"
    t.string   "share_url"
    t.string   "share_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.string   "share_type"
    t.integer  "facebook_page_id"
    t.string   "photo"
    t.string   "video"
  end

  add_index "facebook_shares", ["deleted_at"], name: "index_facebook_shares_on_deleted_at", using: :btree
  add_index "facebook_shares", ["facebook_page_id"], name: "index_facebook_shares_on_facebook_page_id", using: :btree

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "identities", ["deleted_at"], name: "index_identities_on_deleted_at", using: :btree
  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "instagram_accounts", force: :cascade do |t|
    t.integer  "identity_id", null: false
    t.string   "uid",         null: false
    t.string   "token",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "instagram_accounts", ["deleted_at"], name: "index_instagram_accounts_on_deleted_at", using: :btree
  add_index "instagram_accounts", ["identity_id"], name: "index_instagram_accounts_on_identity_id", using: :btree

  create_table "listings", force: :cascade do |t|
    t.string   "address"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.money    "asking_price",           scale: 2
    t.money    "sold_for",               scale: 2
    t.integer  "mls_number",   limit: 8
    t.date     "listed_at"
    t.date     "sold_at"
    t.string   "status",                           null: false
    t.text     "description"
    t.float    "bedrooms"
    t.float    "bathrooms"
    t.integer  "built"
    t.string   "listing_type"
    t.boolean  "pets_allowed"
    t.integer  "square_feet"
    t.integer  "user_id",                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "listings", ["deleted_at"], name: "index_listings_on_deleted_at", using: :btree

  create_table "twitter_accounts", force: :cascade do |t|
    t.integer  "identity_id", null: false
    t.string   "token",       null: false
    t.string   "secret",      null: false
    t.string   "handle",      null: false
    t.string   "uid",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "twitter_accounts", ["deleted_at"], name: "index_twitter_accounts_on_deleted_at", using: :btree
  add_index "twitter_accounts", ["identity_id"], name: "index_twitter_accounts_on_identity_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "full_name"
    t.string   "image"
    t.datetime "deleted_at"
  end

  add_index "users", ["deleted_at"], name: "index_users_on_deleted_at", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "facebook_accounts", "identities"
  add_foreign_key "facebook_pages", "facebook_accounts"
  add_foreign_key "facebook_shares", "facebook_pages"
  add_foreign_key "identities", "users"
  add_foreign_key "instagram_accounts", "identities"
  add_foreign_key "twitter_accounts", "identities"
end
