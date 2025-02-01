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

ActiveRecord::Schema[7.0].define(version: 2024_01_18_062318) do
  create_table "admins", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "admin_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.string "address"
  end

  create_table "courses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "course_name"
    t.boolean "ongoin_course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "ongoing"
    t.integer "duration"
  end

  create_table "enrolments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "marks"
    t.bigint "course_id"
    t.bigint "student_id"
    t.bigint "exam_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "year"
    t.index ["course_id"], name: "index_enrolments_on_course_id"
    t.index ["exam_id"], name: "index_enrolments_on_exam_id"
    t.index ["student_id"], name: "index_enrolments_on_student_id"
  end

  create_table "exams", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "exam_name"
    t.boolean "ongoing_year_exam"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "student_name"
    t.bigint "user_id"
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.string "address"
    t.index ["admin_id"], name: "index_students_on_admin_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "teacher_courses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "year"
    t.bigint "teacher_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_teacher_courses_on_course_id"
    t.index ["teacher_id"], name: "index_teacher_courses_on_teacher_id"
  end

  create_table "teachers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "teacher_name"
    t.bigint "user_id"
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.string "address"
    t.index ["admin_id"], name: "index_teachers_on_admin_id"
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "enrolments", "courses"
  add_foreign_key "enrolments", "exams"
  add_foreign_key "enrolments", "students"
  add_foreign_key "students", "admins"
  add_foreign_key "students", "users"
  add_foreign_key "teacher_courses", "courses"
  add_foreign_key "teacher_courses", "teachers"
  add_foreign_key "teachers", "admins"
  add_foreign_key "teachers", "users"
end
