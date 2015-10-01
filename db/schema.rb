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

ActiveRecord::Schema.define(version: 20150930035007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string  "nickname"
    t.string  "name"
    t.string  "number"
    t.string  "complement"
    t.string  "neighborhood"
    t.string  "zip_code"
    t.string  "city"
    t.string  "state"
    t.string  "country"
    t.float   "latitude"
    t.float   "longitude"
    t.integer "store_id"
  end

  add_index "addresses", ["store_id"], name: "index_addresses_on_store_id", using: :btree

  create_table "buses", force: :cascade do |t|
    t.string   "identification_number"
    t.string   "line"
    t.integer  "company_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "buses", ["company_id"], name: "index_buses_on_company_id", using: :btree
  add_index "buses", ["identification_number"], name: "index_buses_on_identification_number", using: :btree
  add_index "buses", ["line"], name: "index_buses_on_line", using: :btree

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "carts", ["user_id"], name: "index_carts_on_user_id", unique: true, using: :btree

  create_table "carts_skus", force: :cascade do |t|
    t.integer "cart_id"
    t.integer "sku_id"
  end

  add_index "carts_skus", ["cart_id"], name: "index_carts_skus_on_cart_id", using: :btree
  add_index "carts_skus", ["sku_id"], name: "index_carts_skus_on_sku_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "companies", ["name"], name: "index_companies_on_name", unique: true, using: :btree

  create_table "feedbacks", force: :cascade do |t|
    t.text     "content"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "opinion"
    t.string   "user"
    t.datetime "sent_at"
    t.integer  "bus_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "feedbacks", ["bus_id"], name: "index_feedbacks_on_bus_id", using: :btree
  add_index "feedbacks", ["opinion"], name: "index_feedbacks_on_opinion", using: :btree
  add_index "feedbacks", ["user"], name: "index_feedbacks_on_user", using: :btree

  create_table "newsletters", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "newsletters", ["email"], name: "index_newsletters_on_email", unique: true, using: :btree

  create_table "pictures", force: :cascade do |t|
    t.string   "url"
    t.string   "link_instagram"
    t.string   "id_instagram"
    t.string   "status",         default: "pending"
    t.text     "description"
    t.integer  "store_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.text     "terms"
  end

  add_index "pictures", ["store_id"], name: "index_pictures_on_store_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.integer  "store_id"
    t.string   "name"
    t.text     "description"
    t.string   "tags",                                default: ""
    t.string   "image"
    t.decimal  "price",       precision: 8, scale: 2, default: 0.0
    t.integer  "discount"
    t.string   "status",                              default: "incomplete"
    t.string   "gender"
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

  add_index "products", ["store_id"], name: "index_products_on_store_id", using: :btree

  create_table "skus", force: :cascade do |t|
    t.string  "size"
    t.boolean "available"
    t.integer "quantity"
    t.integer "product_id"
  end

  add_index "skus", ["product_id"], name: "index_skus_on_product_id", using: :btree

  create_table "social_networks", force: :cascade do |t|
    t.string  "instagram"
    t.string  "facebook"
    t.string  "twitter"
    t.integer "store_id"
  end

  add_index "social_networks", ["store_id"], name: "index_social_networks_on_store_id", using: :btree

  create_table "stores", force: :cascade do |t|
    t.string   "username"
    t.string   "name"
    t.string   "bio"
    t.string   "instagram_id"
    t.string   "profile_picture"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "stores", ["instagram_id"], name: "index_stores_on_instagram_id", unique: true, using: :btree
  add_index "stores", ["username"], name: "index_stores_on_username", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.json     "provider",               default: {}
    t.string   "username"
    t.integer  "store_id"
    t.string   "category",               default: "common"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["category"], name: "index_users_on_category", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["store_id"], name: "index_users_on_store_id", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "addresses", "stores"
  add_foreign_key "buses", "companies"
  add_foreign_key "feedbacks", "buses"
  add_foreign_key "pictures", "stores"
  add_foreign_key "products", "stores"
  add_foreign_key "skus", "products"
  add_foreign_key "social_networks", "stores"
  add_foreign_key "users", "stores"
end
