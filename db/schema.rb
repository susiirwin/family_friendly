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

ActiveRecord::Schema.define(version: 20161108035621) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.text     "amenity_name"
    t.boolean  "available",    default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "business_amenities", force: :cascade do |t|
    t.integer  "amenity_id"
    t.integer  "business_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["amenity_id"], name: "index_business_amenities_on_amenity_id", using: :btree
    t.index ["business_id"], name: "index_business_amenities_on_business_id", using: :btree
  end

  create_table "businesses", force: :cascade do |t|
    t.string   "name"
    t.string   "yelp_id"
    t.string   "address"
    t.string   "phone"
    t.decimal  "star_rating"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "families", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_families_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "business_id"
    t.text     "comments"
    t.decimal  "family_rating", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["business_id"], name: "index_reviews_on_business_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "screen_name"
    t.string   "uid"
    t.string   "oauth_token"
    t.string   "oauth_token_secret"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "name"
  end

  add_foreign_key "business_amenities", "amenities"
  add_foreign_key "business_amenities", "businesses"
  add_foreign_key "families", "users"
  add_foreign_key "reviews", "businesses"
  add_foreign_key "reviews", "users"
end
