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

ActiveRecord::Schema[7.0].define(version: 2022_08_30_161445) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "maintenances", force: :cascade do |t|
    t.bigint "vehicle_id", null: false
    t.string "title"
    t.string "description"
    t.string "priority"
    t.integer "recorrency"
    t.float "price", default: 0.0
    t.string "status", default: "Undone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id"], name: "index_maintenances_on_vehicle_id"
  end

  create_table "problems", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "priority"
    t.float "price", default: 0.0
    t.string "status", default: "Unresolved"
    t.bigint "vehicle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id"], name: "index_problems_on_vehicle_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "type_of_vehicle"
    t.string "make"
    t.string "model"
    t.string "plate"
    t.integer "year"
    t.integer "mileage"
    t.string "driver"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_vehicles_on_user_id"
  end

  create_table "wishlists", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "status", default: "Not Bought Yet"
    t.bigint "vehicle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price", default: 0.0
    t.index ["vehicle_id"], name: "index_wishlists_on_vehicle_id"
  end

  add_foreign_key "maintenances", "vehicles"
  add_foreign_key "problems", "vehicles"
  add_foreign_key "vehicles", "users"
  add_foreign_key "wishlists", "vehicles"
end
