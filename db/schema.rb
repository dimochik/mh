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

ActiveRecord::Schema.define(version: 20170401195400) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.integer "addressable_id",   limit: 4
    t.string  "addressable_type", limit: 255
    t.string  "county_name",      limit: 255
    t.string  "city",             limit: 255
    t.string  "state",            limit: 255
    t.string  "number",           limit: 255
    t.string  "street",           limit: 255
    t.string  "street_type",      limit: 255
    t.string  "zip",              limit: 255
    t.string  "full_address",     limit: 255
    t.integer "county_id",        limit: 4
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "area_stats", force: :cascade do |t|
    t.integer "informable_id",     limit: 4
    t.string  "informable_type",   limit: 255
    t.string  "name",              limit: 255
    t.integer "population",        limit: 4
    t.integer "median_home_price", limit: 4
    t.integer "household_income",  limit: 4
    t.decimal "house_vacancy",                 precision: 10, scale: 2
    t.decimal "unemployment",                  precision: 10, scale: 2
    t.decimal "future_job_growth",             precision: 10, scale: 2
    t.string  "link",              limit: 255
  end

  create_table "counties", force: :cascade do |t|
    t.string  "name",          limit: 255
    t.integer "metro_area_id", limit: 4
  end

  create_table "metro_areas", force: :cascade do |t|
    t.string  "name",     limit: 255
    t.integer "state_id", limit: 4
  end

  create_table "mobile_homes", force: :cascade do |t|
    t.integer  "owner_id",          limit: 4
    t.string   "park_name",         limit: 255
    t.integer  "number_of_lots",    limit: 4
    t.integer  "occupied_lots",     limit: 4
    t.integer  "occupancy_percent", limit: 4
    t.string   "vendor_url",        limit: 255
    t.integer  "vendor_id",         limit: 4
    t.string   "park_web_site_url", limit: 255
    t.string   "poh",               limit: 255
    t.decimal  "lot_rent",                        precision: 10
    t.string   "water",             limit: 255
    t.string   "sewer",             limit: 255
    t.string   "trash",             limit: 255
    t.boolean  "fifty_five_plus"
    t.text     "description",       limit: 65535
    t.string   "parcel_id",         limit: 255
    t.string   "county_id",         limit: 255
    t.integer  "rausa_id",          limit: 4
    t.string   "state",             limit: 255
    t.datetime "trans_date"
    t.decimal  "sale_price",                      precision: 10
    t.decimal  "mkt_val_land",                    precision: 10
    t.decimal  "mkt_val_bldg",                    precision: 10
    t.decimal  "mkt_val_tot",                     precision: 10
    t.integer  "bldg_sqft",         limit: 4
    t.string   "ngh_code",          limit: 255
    t.string   "land_use_code",     limit: 255
    t.string   "land_use_class",    limit: 255
    t.string   "story_height",      limit: 255
    t.string   "muni_id",           limit: 255
    t.string   "school_dist_id",    limit: 255
    t.decimal  "acreage_deeded",                  precision: 10
    t.decimal  "acreage_calc",                    precision: 10
    t.text     "geom_as_wkt",       limit: 65535
    t.string   "vendor_name",       limit: 255
    t.boolean  "duplicate"
    t.boolean  "address_verified"
    t.boolean  "owner_verified"
    t.string   "m_full_address",    limit: 255
    t.string   "mak_key",           limit: 255
  end

  add_index "mobile_homes", ["mak_key"], name: "index_mobile_homes_on_mak_key", using: :btree

  create_table "owners", force: :cascade do |t|
    t.string "name",                 limit: 255
    t.string "mail_name",            limit: 255
    t.string "second_owners_name",   limit: 255
    t.string "corporate_owner_name", limit: 255
  end

  create_table "states", force: :cascade do |t|
    t.string "name",         limit: 255
    t.string "abbreviation", limit: 255
  end

end
