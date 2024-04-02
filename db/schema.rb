# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_02_094123) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "to"
    t.date "from"
    t.float "total_price"
    t.bigint "castles_id", null: false
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["castles_id"], name: "index_bookings_on_castles_id"
    t.index ["users_id"], name: "index_bookings_on_users_id"
  end

  create_table "castles", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.float "price"
    t.text "description"
    t.integer "rating"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_castles_on_user_id"
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.bigint "castles_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["castles_id"], name: "index_favourites_on_castles_id"
    t.index ["users_id"], name: "index_favourites_on_users_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.float "rating"
    t.bigint "bookings_id", null: false
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bookings_id"], name: "index_reviews_on_bookings_id"
    t.index ["users_id"], name: "index_reviews_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "castles", column: "castles_id"
  add_foreign_key "bookings", "users", column: "users_id"
  add_foreign_key "castles", "users"
  add_foreign_key "favourites", "castles", column: "castles_id"
  add_foreign_key "favourites", "users", column: "users_id"
  add_foreign_key "reviews", "bookings", column: "bookings_id"
  add_foreign_key "reviews", "users", column: "users_id"
end
