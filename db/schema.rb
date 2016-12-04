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

ActiveRecord::Schema.define(version: 20161204133837) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_tokens", force: :cascade do |t|
    t.string   "access_token"
    t.integer  "user_id"
    t.datetime "expired"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_access_tokens_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string   "name"
    t.date     "import_date"
    t.text     "desc"
    t.string   "status"
    t.bigint   "price"
    t.string   "brand"
    t.string   "made_by"
    t.date     "date_producer"
    t.integer  "category_id"
    t.integer  "room_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["category_id"], name: "index_devices_on_category_id", using: :btree
    t.index ["room_id"], name: "index_devices_on_room_id", using: :btree
  end

  create_table "lessons", primary_key: "code", id: :string, force: :cascade do |t|
    t.integer  "start"
    t.integer  "finish"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ranks", primary_key: "level", id: :string, force: :cascade do |t|
    t.text     "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "register_devices", force: :cascade do |t|
    t.string   "status"
    t.text     "reason"
    t.string   "from"
    t.string   "to"
    t.integer  "user_id"
    t.integer  "device_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_register_devices_on_device_id", using: :btree
    t.index ["user_id"], name: "index_register_devices_on_user_id", using: :btree
  end

  create_table "report_devices", force: :cascade do |t|
    t.text     "desc"
    t.string   "rank_id"
    t.integer  "user_id"
    t.integer  "device_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_report_devices_on_device_id", using: :btree
    t.index ["user_id"], name: "index_report_devices_on_user_id", using: :btree
  end

  create_table "rooms", force: :cascade do |t|
    t.integer  "no"
    t.string   "block"
    t.integer  "capacity"
    t.text     "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "address"
    t.string   "phone"
    t.string   "avatar"
    t.integer  "position_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "password_digest"
    t.string   "role",            default: "user"
    t.index ["position_id"], name: "index_users_on_position_id", using: :btree
  end

  add_foreign_key "access_tokens", "users"
  add_foreign_key "devices", "categories"
  add_foreign_key "devices", "rooms"
  add_foreign_key "register_devices", "devices"
  add_foreign_key "register_devices", "lessons", column: "from", primary_key: "code", on_delete: :cascade
  add_foreign_key "register_devices", "lessons", column: "to", primary_key: "code", on_delete: :cascade
  add_foreign_key "register_devices", "users"
  add_foreign_key "report_devices", "devices"
  add_foreign_key "report_devices", "ranks", primary_key: "level"
  add_foreign_key "report_devices", "users"
  add_foreign_key "users", "positions"
end
