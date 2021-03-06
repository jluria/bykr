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

ActiveRecord::Schema.define(version: 20150219194157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: true do |t|
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "stations", force: true do |t|
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "bikes"
    t.integer  "free_docks"
  end

  create_table "users", force: true do |t|
    t.string   "email",                   null: false
    t.string   "password_digest",         null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.float    "max_distance_to_station"
    t.integer  "min_bikes_at_station"
    t.integer  "min_free_bike_docks"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
