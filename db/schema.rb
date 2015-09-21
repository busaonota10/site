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

ActiveRecord::Schema.define(version: 20150921030727) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buses", force: :cascade do |t|
    t.string   "identification_number"
    t.string   "line"
    t.integer  "company_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "buses", ["company_id"], name: "index_buses_on_company_id", using: :btree

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

  add_foreign_key "buses", "companies"
  add_foreign_key "feedbacks", "buses"
end
