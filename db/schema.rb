# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_11_074613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "homecooks", force: :cascade do |t|
    t.integer "price_per_person"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "introduction"
    t.index ["user_id"], name: "index_homecooks_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "datetime"
    t.string "address"
    t.integer "capacity"
    t.text "description"
    t.boolean "status"
    t.bigint "user_id", null: false
    t.bigint "homecook_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["homecook_id"], name: "index_reservations_on_homecook_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "address"
    t.integer "telephone"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "homecooks", "users"
  add_foreign_key "reservations", "homecooks"
  add_foreign_key "reservations", "users"
end
