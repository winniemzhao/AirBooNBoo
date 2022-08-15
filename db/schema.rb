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

ActiveRecord::Schema[7.0].define(version: 2022_08_15_201440) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ghosts", force: :cascade do |t|
    t.string "name"
    t.string "spook_action"
    t.boolean "is_active"
    t.string "location"
    t.text "description"
    t.float "daily_rate"
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_ghosts_on_users_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "comment"
    t.bigint "spooks_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spooks_id"], name: "index_reviews_on_spooks_id"
  end

  create_table "spooks", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.float "total_price"
    t.integer "status"
    t.bigint "ghosts_id", null: false
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ghosts_id"], name: "index_spooks_on_ghosts_id"
    t.index ["users_id"], name: "index_spooks_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "description"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ghosts", "users", column: "users_id"
  add_foreign_key "reviews", "spooks", column: "spooks_id"
  add_foreign_key "spooks", "ghosts", column: "ghosts_id"
  add_foreign_key "spooks", "users", column: "users_id"
end
