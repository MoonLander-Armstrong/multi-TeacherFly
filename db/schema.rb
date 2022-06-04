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

ActiveRecord::Schema.define(version: 2022_06_04_194847) do

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

  create_table "chapters", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "course_id", null: false
    t.string "title"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_chapters_on_course_id"
    t.index ["slug"], name: "index_chapters_on_slug", unique: true
    t.index ["teacher_id"], name: "index_chapters_on_teacher_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "section_id", null: false
    t.bigint "student_id", null: false
    t.bigint "course_id", null: false
    t.text "content"
    t.integer "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_comments_on_course_id"
    t.index ["section_id"], name: "index_comments_on_section_id"
    t.index ["student_id"], name: "index_comments_on_student_id"
    t.index ["teacher_id"], name: "index_comments_on_teacher_id"
  end

  create_table "courses", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.string "title"
    t.text "content"
    t.integer "price"
    t.string "published"
    t.string "description"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "lecturer_id", null: false
    t.index ["slug"], name: "index_courses_on_slug", unique: true
    t.index ["teacher_id"], name: "index_courses_on_teacher_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "lecturers", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.string "name"
    t.string "nickname"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teacher_id"], name: "index_lecturers_on_teacher_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.string "name"
    t.string "email"
    t.integer "price"
    t.string "slug"
    t.string "status"
    t.bigint "course_id", null: false
    t.bigint "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_orders_on_course_id"
    t.index ["slug"], name: "index_orders_on_slug", unique: true
    t.index ["student_id"], name: "index_orders_on_student_id"
    t.index ["teacher_id"], name: "index_orders_on_teacher_id"
  end

  create_table "reads", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.boolean "finished", default: false
    t.bigint "student_id", null: false
    t.bigint "section_id", null: false
    t.string "course_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["section_id"], name: "index_reads_on_section_id"
    t.index ["student_id"], name: "index_reads_on_student_id"
    t.index ["teacher_id"], name: "index_reads_on_teacher_id"
  end

  create_table "sections", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "chapter_id", null: false
    t.string "title"
    t.string "published"
    t.text "content"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chapter_id"], name: "index_sections_on_chapter_id"
    t.index ["slug"], name: "index_sections_on_slug", unique: true
    t.index ["teacher_id"], name: "index_sections_on_teacher_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.string "users", default: "student"
    t.string "role", default: "student"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "teacher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["email", "teacher_id"], name: "index_students_on_email_and_teacher_id", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_students_on_slug", unique: true
    t.index ["teacher_id"], name: "index_students_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.string "users", default: "teacher"
    t.string "role", default: "teacher"
    t.string "school_name", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "uid"
    t.string "slug"
    t.string "domain"
    t.string "subdomain"
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_teachers_on_slug", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "chapters", "courses"
  add_foreign_key "comments", "courses"
  add_foreign_key "comments", "sections"
  add_foreign_key "comments", "students"
  add_foreign_key "orders", "courses"
  add_foreign_key "orders", "students"
  add_foreign_key "reads", "sections"
  add_foreign_key "reads", "students"
  add_foreign_key "sections", "chapters"
end
