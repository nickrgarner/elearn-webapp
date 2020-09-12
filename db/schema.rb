# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20200912135257) do

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_carts_on_student_id"
  end

  create_table "course_sections", force: :cascade do |t|
    t.integer "course_id"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_sections_on_course_id"
    t.index ["teacher_id"], name: "index_course_sections_on_teacher_id"
  end

  create_table "courses", force: :cascade do |t|
    t.integer "course_number"
    t.string "name"
    t.string "area"
    t.float "price"
    t.integer "discipline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipline_id"], name: "index_courses_on_discipline_id"
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string "name"
    t.integer "card_number"
    t.date "expiration_date"
    t.integer "cvv"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_credit_cards_on_student_id"
  end

  create_table "disciplines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string "description"
    t.integer "student_id"
    t.integer "teacher_id"
    t.integer "course_section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer "userable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_profiles_on_email", unique: true
    t.index ["userable_type", "userable_id"], name: "index_profiles_on_userable_type_and_userable_id"
  end

  create_table "purchase_histories", force: :cascade do |t|
    t.integer "course_section_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_section_id"], name: "index_purchase_histories_on_course_section_id"
    t.index ["student_id"], name: "index_purchase_histories_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.integer "discipline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipline_id"], name: "index_students_on_discipline_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.integer "discipline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipline_id"], name: "index_teachers_on_discipline_id"
  end

end
