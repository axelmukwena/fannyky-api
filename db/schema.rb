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

ActiveRecord::Schema.define(version: 2021_11_26_145937) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "awards", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "year"
    t.string "organizer"
    t.string "slug"
    t.bigint "painter_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "pagelink", null: false
    t.index ["pagelink"], name: "index_awards_on_pagelink", unique: true
    t.index ["painter_id"], name: "index_awards_on_painter_id"
    t.index ["user_id"], name: "index_awards_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "exhibitions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "link"
    t.string "location"
    t.string "slug"
    t.bigint "painter_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "start_date"
    t.string "end_date"
    t.string "which"
    t.string "pagelink", null: false
    t.string "organization"
    t.index ["pagelink"], name: "index_exhibitions_on_pagelink", unique: true
    t.index ["painter_id"], name: "index_exhibitions_on_painter_id"
    t.index ["user_id"], name: "index_exhibitions_on_user_id"
  end

  create_table "painters", force: :cascade do |t|
    t.string "name"
    t.text "about"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.string "slug"
    t.integer "paintings_count", default: 0, null: false
    t.integer "exhibitions_count", default: 0, null: false
    t.integer "talks_count", default: 0, null: false
    t.integer "awards_count", default: 0, null: false
    t.integer "publications_count", default: 0, null: false
    t.string "link"
    t.string "pagelink", null: false
    t.index ["pagelink"], name: "index_painters_on_pagelink", unique: true
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
    t.string "date_created"
    t.integer "category_id"
    t.string "abstract"
    t.string "dimension"
    t.string "pagelink", null: false
    t.index ["pagelink"], name: "index_paintings_on_pagelink", unique: true
    t.index ["painter_id"], name: "index_paintings_on_painter_id"
    t.index ["slug"], name: "index_paintings_on_slug", unique: true
    t.index ["user_id"], name: "index_paintings_on_user_id"
  end

  create_table "publications", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "year"
    t.string "organization"
    t.string "location"
    t.string "slug"
    t.bigint "painter_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "link"
    t.string "pagelink", null: false
    t.index ["pagelink"], name: "index_publications_on_pagelink", unique: true
    t.index ["painter_id"], name: "index_publications_on_painter_id"
    t.index ["user_id"], name: "index_publications_on_user_id"
  end

  create_table "talks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "date"
    t.string "organizer"
    t.string "location"
    t.string "link"
    t.string "slug"
    t.bigint "painter_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "pagelink", null: false
    t.index ["pagelink"], name: "index_talks_on_pagelink", unique: true
    t.index ["painter_id"], name: "index_talks_on_painter_id"
    t.index ["user_id"], name: "index_talks_on_user_id"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "awards", "painters"
  add_foreign_key "awards", "users"
  add_foreign_key "exhibitions", "painters"
  add_foreign_key "exhibitions", "users"
  add_foreign_key "paintings", "painters"
  add_foreign_key "paintings", "users"
  add_foreign_key "publications", "painters"
  add_foreign_key "publications", "users"
  add_foreign_key "talks", "painters"
  add_foreign_key "talks", "users"
end
