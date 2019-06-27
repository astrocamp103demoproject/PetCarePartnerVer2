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

ActiveRecord::Schema.define(version: 2019_06_23_090433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booking_dates", force: :cascade do |t|
    t.bigint "sitter_id"
    t.date "date"
    t.string "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sitter_id"], name: "index_booking_dates_on_sitter_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.date "drop_off"
    t.date "pick_up"
    t.text "note"
    t.string "state", default: "pending"
    t.date "checkout_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sitter_id"
    t.index ["sitter_id"], name: "index_orders_on_sitter_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "order_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "pets", force: :cascade do |t|
    t.integer "size"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pet_type"
    t.string "name"
    t.string "breed"
    t.integer "age"
    t.string "sex"
    t.text "note"
    t.string "pic"
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.bigint "sitter_id"
    t.string "pic"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sitter_id"], name: "index_pictures_on_sitter_id"
    t.index ["user_id"], name: "index_pictures_on_user_id"
  end

  create_table "sitters", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "address"
    t.string "avatar"
    t.string "pic"
    t.integer "square_meters"
    t.integer "pet_limit"
    t.text "slogan"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "password"
    t.string "address"
    t.integer "pet_count"
    t.string "avatar"
    t.string "pic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "role", default: "user"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "booking_dates", "sitters"
  add_foreign_key "orders", "users"
  add_foreign_key "payments", "orders"
  add_foreign_key "pets", "users"
  add_foreign_key "pictures", "sitters"
  add_foreign_key "pictures", "users"
end
