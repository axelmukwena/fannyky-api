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

ActiveRecord::Schema.define(version: 2021_10_08_063500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allowlisted_jwts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.string "aud", default: "UNKNOWN"
    t.string "remote_ip"
    t.string "os_data"
    t.string "browser_data"
    t.string "device_data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["jti"], name: "index_allowlisted_jwts_on_jti", unique: true
    t.index ["user_id"], name: "index_allowlisted_jwts_on_user_id"
  end

  create_table "exhibitions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "link"
    t.string "location"
    t.string "slug"
    t.integer "images_count"
    t.bigint "painter_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "when"
    t.date "start_date"
    t.date "end_date"
    t.index ["painter_id"], name: "index_exhibitions_on_painter_id"
    t.index ["title"], name: "index_exhibitions_on_title", unique: true
    t.index ["user_id"], name: "index_exhibitions_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "image"
    t.integer "priority"
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable"
  end

  create_table "painters", force: :cascade do |t|
    t.string "name"
    t.text "about"
    t.string "email"
    t.string "phone"
    t.string "facebook"
    t.string "instagram"
    t.string "twitter"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.string "slug"
    t.integer "images_count"
    t.index ["name"], name: "index_painters_on_name", unique: true
    t.index ["slug"], name: "index_painters_on_slug", unique: true
    t.index ["user_id"], name: "index_painters_on_user_id"
  end

  create_table "paintings", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "painter_id", null: false
    t.string "slug"
    t.integer "images_count"
    t.date "date_created"
    t.index ["painter_id"], name: "index_paintings_on_painter_id"
    t.index ["slug"], name: "index_paintings_on_slug", unique: true
    t.index ["title"], name: "index_paintings_on_title", unique: true
    t.index ["user_id"], name: "index_paintings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "allowlisted_jwts", "users", on_delete: :cascade
  add_foreign_key "exhibitions", "painters"
  add_foreign_key "exhibitions", "users"
  add_foreign_key "paintings", "painters"
  add_foreign_key "paintings", "users"
end
