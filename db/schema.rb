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

ActiveRecord::Schema.define(version: 2020_09_18_010713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "adminpack"
  enable_extension "pgagent"
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cart_objects", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "course_section_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_cart_objects_on_cart_id"
    t.index ["course_section_id"], name: "index_cart_objects_on_course_section_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "student_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_carts_on_student_id"
  end

  create_table "course_sections", force: :cascade do |t|
    t.bigint "course_id"
    t.bigint "teacher_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_course_sections_on_course_id"
    t.index ["teacher_id"], name: "index_course_sections_on_teacher_id"
  end

  create_table "courses", force: :cascade do |t|
    t.integer "course_number"
    t.string "name"
    t.string "area"
    t.float "price"
    t.bigint "discipline_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["discipline_id"], name: "index_courses_on_discipline_id"
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string "name"
    t.bigint "card_number"
    t.date "expiration_date"
    t.integer "cvv"
    t.bigint "student_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_credit_cards_on_student_id"
  end

  create_table "disciplines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string "description"
    t.bigint "student_id"
    t.bigint "teacher_id"
    t.bigint "course_section_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_section_id"], name: "index_feedbacks_on_course_section_id"
    t.index ["student_id"], name: "index_feedbacks_on_student_id"
    t.index ["teacher_id"], name: "index_feedbacks_on_teacher_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.text "address"
    t.string "password_digest"
    t.string "userable_type"
    t.bigint "userable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_profiles_on_email", unique: true
    t.index ["userable_type", "userable_id"], name: "index_profiles_on_userable_type_and_userable_id"
  end

  create_table "purchase_histories", force: :cascade do |t|
    t.bigint "course_section_id"
    t.bigint "student_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "price"
    t.index ["course_section_id"], name: "index_purchase_histories_on_course_section_id"
    t.index ["student_id"], name: "index_purchase_histories_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.bigint "discipline_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["discipline_id"], name: "index_students_on_discipline_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.bigint "discipline_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["discipline_id"], name: "index_teachers_on_discipline_id"
  end

  add_foreign_key "cart_objects", "carts"
  add_foreign_key "cart_objects", "course_sections"
end
