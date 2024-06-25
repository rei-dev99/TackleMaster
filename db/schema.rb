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

ActiveRecord::Schema[7.1].define(version: 2024_06_24_230033) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accesories", force: :cascade do |t|
    t.string "name", null: false
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "maker"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "authentications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "provider", null: false
    t.string "uid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_authentications_on_provider_and_uid"
  end

  create_table "fishing_gears", force: :cascade do |t|
    t.string "fish_type"
    t.string "budget"
    t.string "location"
    t.string "fishing_type"
    t.string "tackle_type"
    t.string "tackle_maker"
    t.string "skill_level"
    t.text "memo"
    t.text "suggestion"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fishing_gears_on_user_id"
  end

  create_table "fishing_plans", force: :cascade do |t|
    t.date "fishing_date", null: false
    t.string "location", null: false
    t.float "temperature"
    t.float "wind_speed"
    t.string "weather_condition"
    t.float "precipitation_probability"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "fish_types", null: false
    t.integer "tackle_id"
  end

  create_table "reels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "memo"
    t.string "maker"
  end

  create_table "rods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "memo"
    t.string "maker"
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
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "suggestion_count", default: 0
    t.datetime "last_suggestion_at"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "fishing_gears", "users"
  add_foreign_key "fishing_plans", "tackles"
  add_foreign_key "tackle_accesories", "accesories"
  add_foreign_key "tackle_accesories", "tackles"
  add_foreign_key "tackle_reels", "reels"
  add_foreign_key "tackle_reels", "tackles"
  add_foreign_key "tackle_rods", "rods"
  add_foreign_key "tackle_rods", "tackles"
  add_foreign_key "tackles", "users"
end
