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

ActiveRecord::Schema.define(version: 2019_06_11_082003) do

  create_table "booking_dates", force: :cascade do |t|
    t.integer "sitter_id"
    t.integer "order_id"
    t.datetime "date"
    t.boolean "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_booking_dates_on_order_id"
    t.index ["sitter_id"], name: "index_booking_dates_on_sitter_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "drop_off"
    t.datetime "pick_up"
    t.text "note"
    t.string "status"
    t.datetime "checkout_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sitter_id"
    t.index ["sitter_id"], name: "index_orders_on_sitter_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "order_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "pets", force: :cascade do |t|
    t.integer "size"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pets_on_user_id"
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
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "address"
    t.string "pet_count"
    t.string "avatar"
    t.string "pic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
