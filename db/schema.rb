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

ActiveRecord::Schema.define(version: 2022_02_16_144721) do

  create_table "reservations", force: :cascade do |t|
    t.integer "sign_id"
    t.integer "room_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "cost"
    t.date "start_date"
    t.date "end_date"
    t.integer "number"
    t.integer "days"
    t.string "icon"
    t.string "introduction"
    t.string "name"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.string "introduction"
    t.string "price"
    t.string "address"
    t.string "icon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sign_id"
    t.date "start_date"
    t.date "end_date"
    t.integer "number"
    t.integer "cost"
    t.integer "days"
    t.string "confirm"
    t.integer "sign_id_check"
    t.index ["sign_id"], name: "index_rooms_on_sign_id"
  end

  create_table "signs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.text "introduction"
    t.string "icon"
    t.integer "room_id"
    t.index ["email"], name: "index_signs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_signs_on_reset_password_token", unique: true
    t.index ["room_id"], name: "index_signs_on_room_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text "introduction"
    t.binary "icon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sign_id"
    t.index ["sign_id"], name: "index_users_on_sign_id"
  end

  add_foreign_key "rooms", "signs"
  add_foreign_key "signs", "rooms"
  add_foreign_key "users", "signs"
end
