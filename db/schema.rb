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

ActiveRecord::Schema.define(version: 2020_06_03_201536) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.string "activity_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "eleve_id"
    t.bigint "lesson_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status", default: "ongoing"
    t.bigint "canceller_id"
    t.datetime "cancellation_time"
    t.boolean "refundable"
    t.index ["canceller_id"], name: "index_bookings_on_canceller_id"
    t.index ["eleve_id"], name: "index_bookings_on_eleve_id"
    t.index ["lesson_id"], name: "index_bookings_on_lesson_id"
  end

  create_table "eleves", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "surname"
    t.date "birthdate"
    t.boolean "prof"
    t.string "sex"
    t.string "phone_number"
    t.string "country"
    t.string "city"
    t.text "presentation"
    t.string "facebook"
    t.string "twitter"
    t.string "instagram"
    t.string "siret_number"
    t.string "company_address"
    t.string "iban"
    t.string "bic"
    t.string "status"
    t.boolean "moderated", default: false
    t.bigint "user_id"
    t.bigint "sport_id"
    t.bigint "activity_id"
    t.index ["activity_id"], name: "index_eleves_on_activity_id"
    t.index ["sport_id"], name: "index_eleves_on_sport_id"
    t.index ["user_id"], name: "index_eleves_on_user_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.date "lesson_date"
    t.text "lesson_description"
    t.text "lesson_material_needed"
    t.integer "review"
    t.string "lesson_name"
    t.string "lesson_level"
    t.integer "lesson_duration"
    t.string "lesson_language"
    t.float "lesson_price"
    t.float "lesson_discount_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "sport_id"
    t.bigint "activity_id"
    t.bigint "eleve_id"
    t.bigint "template_id"
    t.datetime "start"
    t.datetime "end"
    t.string "streaming_url"
    t.string "status", default: "scheduled"
    t.index ["activity_id"], name: "index_lessons_on_activity_id"
    t.index ["eleve_id"], name: "index_lessons_on_eleve_id"
    t.index ["sport_id"], name: "index_lessons_on_sport_id"
    t.index ["template_id"], name: "index_lessons_on_template_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.integer "rating"
    t.bigint "eleve_id"
    t.bigint "lesson_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["eleve_id"], name: "index_reviews_on_eleve_id"
    t.index ["lesson_id"], name: "index_reviews_on_lesson_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "sport_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "templates", force: :cascade do |t|
    t.text "template_description"
    t.text "template_material_needed"
    t.string "template_name"
    t.string "template_level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "sport_id"
    t.bigint "activity_id"
    t.bigint "eleve_id"
    t.index ["activity_id"], name: "index_templates_on_activity_id"
    t.index ["eleve_id"], name: "index_templates_on_eleve_id"
    t.index ["sport_id"], name: "index_templates_on_sport_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "prof", default: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "eleves", column: "canceller_id"
  add_foreign_key "bookings", "eleves", column: "eleve_id"
  add_foreign_key "bookings", "lessons"
  add_foreign_key "eleves", "activities"
  add_foreign_key "eleves", "sports"
  add_foreign_key "eleves", "users"
  add_foreign_key "lessons", "activities"
  add_foreign_key "lessons", "eleves", column: "eleve_id"
  add_foreign_key "lessons", "sports"
  add_foreign_key "lessons", "templates"
  add_foreign_key "reviews", "eleves", column: "eleve_id"
  add_foreign_key "reviews", "lessons"
  add_foreign_key "templates", "activities"
  add_foreign_key "templates", "eleves", column: "eleve_id"
  add_foreign_key "templates", "sports"
end
