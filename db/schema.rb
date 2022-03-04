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

ActiveRecord::Schema.define(version: 2022_03_04_222659) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_admins_on_user_id"
  end

  create_table "foreign_courses", force: :cascade do |t|
    t.string "foreign_course_name"
    t.integer "contact_hours"
    t.string "semester_approved"
    t.bigint "tamu_department_id", null: false
    t.bigint "university_id", null: false
    t.integer "foreign_course_num"
    t.string "foreign_course_dept"
    t.boolean "course_approval_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tamu_department_id"], name: "index_foreign_courses_on_tamu_department_id"
    t.index ["university_id"], name: "index_foreign_courses_on_university_id"
  end

  create_table "foreign_courses_students", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "foreign_course_id", null: false
    t.boolean "admin_course_approval"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["foreign_course_id"], name: "index_foreign_courses_students_on_foreign_course_id"
    t.index ["student_id"], name: "index_foreign_courses_students_on_student_id"
  end

  create_table "foreign_courses_tamu_courses", force: :cascade do |t|
    t.bigint "foreign_course_id", null: false
    t.bigint "tamu_course_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["foreign_course_id"], name: "index_foreign_courses_tamu_courses_on_foreign_course_id"
    t.index ["tamu_course_id"], name: "index_foreign_courses_tamu_courses_on_tamu_course_id"
  end

  create_table "reviewers", force: :cascade do |t|
    t.bigint "tamu_department_id", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tamu_department_id"], name: "index_reviewers_on_tamu_department_id"
    t.index ["user_id"], name: "index_reviewers_on_user_id"
  end

  create_table "students", force: :cascade do |t|
    t.bigint "tamu_department_id", null: false
    t.bigint "user_id", null: false
    t.string "tamu_major"
    t.string "tamu_college"
    t.string "classification"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tamu_department_id"], name: "index_students_on_tamu_department_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "tamu_courses", force: :cascade do |t|
    t.integer "course_num"
    t.bigint "tamu_department_id", null: false
    t.string "course_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tamu_department_id"], name: "index_tamu_courses_on_tamu_department_id"
  end

  create_table "tamu_departments", force: :cascade do |t|
    t.string "tamu_department_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "universities", force: :cascade do |t|
    t.string "city_country"
    t.string "university_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.integer "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "foreign_courses", "tamu_departments"
  add_foreign_key "foreign_courses", "universities"
  add_foreign_key "foreign_courses_students", "foreign_courses"
  add_foreign_key "foreign_courses_students", "students"
  add_foreign_key "foreign_courses_tamu_courses", "foreign_courses"
  add_foreign_key "reviewers", "tamu_departments"
  add_foreign_key "students", "tamu_departments"
  add_foreign_key "students", "users"
  add_foreign_key "tamu_courses", "tamu_departments"
end
