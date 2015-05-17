# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150517210237) do

  create_table "careers", force: true do |t|
    t.integer  "faculty_id"
    t.integer  "university_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "careers", ["faculty_id"], name: "index_careers_on_faculty_id", using: :btree
  add_index "careers", ["university_id"], name: "index_careers_on_university_id", using: :btree

  create_table "course_comments", force: true do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_comments", ["course_id"], name: "index_course_comments_on_course_id", using: :btree
  add_index "course_comments", ["user_id"], name: "index_course_comments_on_user_id", using: :btree

  create_table "course_evaluations", force: true do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.integer  "rubric1"
    t.integer  "rubric2"
    t.integer  "rubric3"
    t.integer  "rubric4"
    t.integer  "rubric5"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_evaluations", ["course_id"], name: "index_course_evaluations_on_course_id", using: :btree
  add_index "course_evaluations", ["user_id"], name: "index_course_evaluations_on_user_id", using: :btree

  create_table "courses", force: true do |t|
    t.integer  "career_id"
    t.integer  "university_id"
    t.integer  "faculty_id"
    t.string   "name"
    t.float    "eval_sum",      limit: 24
    t.integer  "eval_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["career_id"], name: "index_courses_on_career_id", using: :btree
  add_index "courses", ["faculty_id"], name: "index_courses_on_faculty_id", using: :btree
  add_index "courses", ["university_id"], name: "index_courses_on_university_id", using: :btree

  create_table "faculties", force: true do |t|
    t.integer  "university_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faculties", ["university_id"], name: "index_faculties_on_university_id", using: :btree

  create_table "teacher_comments", force: true do |t|
    t.integer  "teacher_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teacher_comments", ["teacher_id"], name: "index_teacher_comments_on_teacher_id", using: :btree
  add_index "teacher_comments", ["user_id"], name: "index_teacher_comments_on_user_id", using: :btree

  create_table "teacher_evaluations", force: true do |t|
    t.integer  "teacher_id"
    t.integer  "user_id"
    t.integer  "rubric1"
    t.integer  "rubric2"
    t.integer  "rubric3"
    t.integer  "rubric4"
    t.integer  "rubric5"
    t.integer  "rubric6"
    t.integer  "rubric7"
    t.integer  "rubric8"
    t.integer  "rubric9"
    t.integer  "rubric10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teacher_evaluations", ["teacher_id"], name: "index_teacher_evaluations_on_teacher_id", using: :btree
  add_index "teacher_evaluations", ["user_id"], name: "index_teacher_evaluations_on_user_id", using: :btree

  create_table "teachers", force: true do |t|
    t.integer  "university_id"
    t.integer  "faculty_id"
    t.string   "name"
    t.string   "last_name"
    t.float    "eval_sum",      limit: 24, default: 0.0
    t.integer  "eval_amount",              default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teachers", ["faculty_id"], name: "index_teachers_on_faculty_id", using: :btree
  add_index "teachers", ["university_id"], name: "index_teachers_on_university_id", using: :btree

  create_table "universities", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "uid"
    t.string   "provider"
    t.boolean  "manager",                default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "careers", "faculties", name: "careers_faculty_id_fk"
  add_foreign_key "careers", "universities", name: "careers_university_id_fk"

  add_foreign_key "course_comments", "courses", name: "course_comments_course_id_fk"
  add_foreign_key "course_comments", "users", name: "course_comments_user_id_fk"

  add_foreign_key "course_evaluations", "courses", name: "course_evaluations_course_id_fk"
  add_foreign_key "course_evaluations", "users", name: "course_evaluations_user_id_fk"

  add_foreign_key "courses", "careers", name: "courses_career_id_fk"
  add_foreign_key "courses", "faculties", name: "courses_faculty_id_fk"
  add_foreign_key "courses", "universities", name: "courses_university_id_fk"

  add_foreign_key "faculties", "universities", name: "faculties_university_id_fk"

  add_foreign_key "teacher_comments", "teachers", name: "teacher_comments_teacher_id_fk"
  add_foreign_key "teacher_comments", "users", name: "teacher_comments_user_id_fk"

  add_foreign_key "teacher_evaluations", "teachers", name: "teacher_evaluations_teacher_id_fk"
  add_foreign_key "teacher_evaluations", "users", name: "teacher_evaluations_user_id_fk"

  add_foreign_key "teachers", "faculties", name: "teachers_faculty_id_fk"
  add_foreign_key "teachers", "universities", name: "teachers_university_id_fk"

end
