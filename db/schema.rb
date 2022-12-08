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

ActiveRecord::Schema.define(version: 2022_12_08_214011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "btree_gin"
  enable_extension "btree_gist"
  enable_extension "citext"
  enable_extension "cube"
  enable_extension "dblink"
  enable_extension "dict_int"
  enable_extension "dict_xsyn"
  enable_extension "earthdistance"
  enable_extension "fuzzystrmatch"
  enable_extension "hstore"
  enable_extension "intarray"
  enable_extension "ltree"
  enable_extension "pg_stat_statements"
  enable_extension "pg_trgm"
  enable_extension "pgcrypto"
  enable_extension "pgrowlocks"
  enable_extension "pgstattuple"
  enable_extension "plpgsql"
  enable_extension "tablefunc"
  enable_extension "unaccent"
  enable_extension "uuid-ossp"
  enable_extension "xml2"

  create_table "drivers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "status"
    t.string "country"
    t.string "state"
    t.string "city"
    t.integer "age"
    t.decimal "current_latitude"
    t.decimal "current_longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.string "acceptance_token"
    t.string "payment_method"
  end

  create_table "payment_sources", force: :cascade do |t|
    t.integer "payment_source_id"
    t.string "method"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "riders", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "status"
    t.string "country"
    t.string "state"
    t.string "city"
    t.integer "age"
    t.decimal "current_latitude"
    t.decimal "current_longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.string "acceptance_token"
    t.string "payment_method"
    t.integer "payment_source_id"
  end

  create_table "rides", force: :cascade do |t|
    t.integer "driver_id"
    t.integer "rider_id"
    t.decimal "current_latitude"
    t.decimal "current_longitude"
    t.decimal "final_latitude"
    t.decimal "final_longitude"
    t.decimal "charge"
    t.boolean "paid_out"
    t.string "status"
    t.decimal "distance_km"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "base_fee"
    t.decimal "duration"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "ride_id"
    t.integer "driver_id"
    t.integer "rider_id"
    t.decimal "amount"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
