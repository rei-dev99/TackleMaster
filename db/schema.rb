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

ActiveRecord::Schema[7.1].define(version: 2024_05_16_224854) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accesories", force: :cascade do |t|
    t.string "name", null: false
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "memo"
  end

  create_table "rods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "memo"
  end

  create_table "tackle_accesories", force: :cascade do |t|
    t.bigint "tackle_id", null: false
    t.bigint "accesory_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accesory_id"], name: "index_tackle_accesories_on_accesory_id"
    t.index ["tackle_id"], name: "index_tackle_accesories_on_tackle_id"
  end

  create_table "tackle_reels", force: :cascade do |t|
    t.bigint "tackle_id", null: false
    t.bigint "reel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reel_id"], name: "index_tackle_reels_on_reel_id"
    t.index ["tackle_id"], name: "index_tackle_reels_on_tackle_id"
  end

  create_table "tackle_rods", force: :cascade do |t|
    t.bigint "tackle_id", null: false
    t.bigint "rod_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rod_id"], name: "index_tackle_rods_on_rod_id"
    t.index ["tackle_id"], name: "index_tackle_rods_on_tackle_id"
  end

  create_table "tackles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tackles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password", null: false
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "tackle_accesories", "accesories"
  add_foreign_key "tackle_accesories", "tackles"
  add_foreign_key "tackle_reels", "reels"
  add_foreign_key "tackle_reels", "tackles"
  add_foreign_key "tackle_rods", "rods"
  add_foreign_key "tackle_rods", "tackles"
  add_foreign_key "tackles", "users"
end
