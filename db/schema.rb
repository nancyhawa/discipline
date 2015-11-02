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

ActiveRecord::Schema.define(version: 20151102195323) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "detention_attendances", force: :cascade do |t|
    t.date     "date"
    t.integer  "staff_member_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "detention_attendances", ["staff_member_id"], name: "index_detention_attendances_on_staff_member_id", using: :btree

  create_table "detention_students", force: :cascade do |t|
    t.integer  "detention_attendance_id"
    t.integer  "students_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "detention_students", ["detention_attendance_id"], name: "index_detention_students_on_detention_attendance_id", using: :btree
  add_index "detention_students", ["students_id"], name: "index_detention_students_on_students_id", using: :btree

  create_table "infractions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parents", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "referral_infractions", force: :cascade do |t|
    t.integer  "referral_id"
    t.integer  "infraction_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "referral_infractions", ["infraction_id"], name: "index_referral_infractions_on_infraction_id", using: :btree
  add_index "referral_infractions", ["referral_id"], name: "index_referral_infractions_on_referral_id", using: :btree

  create_table "referrals", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "staff_member_id"
    t.boolean  "positive?"
    t.string   "referral_type"
    t.text     "anecdotal"
    t.text     "additional_information"
    t.integer  "points"
    t.date     "date"
    t.boolean  "deans_referral?"
    t.string   "period"
    t.string   "integer"
    t.string   "location"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "referrals", ["staff_member_id"], name: "index_referrals_on_staff_member_id", using: :btree
  add_index "referrals", ["student_id"], name: "index_referrals_on_student_id", using: :btree

  create_table "roster_students", force: :cascade do |t|
    t.integer  "roster_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "roster_students", ["roster_id"], name: "index_roster_students_on_roster_id", using: :btree
  add_index "roster_students", ["student_id"], name: "index_roster_students_on_student_id", using: :btree

  create_table "rosters", force: :cascade do |t|
    t.integer  "staff_member_id"
    t.string   "title"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "rosters", ["staff_member_id"], name: "index_rosters_on_staff_member_id", using: :btree

  create_table "school_infractions", force: :cascade do |t|
    t.integer  "school_id"
    t.integer  "infraction_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "school_infractions", ["infraction_id"], name: "index_school_infractions_on_infraction_id", using: :btree
  add_index "school_infractions", ["school_id"], name: "index_school_infractions_on_school_id", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staff_members", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "professional_name"
    t.string   "role"
    t.string   "title"
    t.integer  "school_id"
    t.boolean  "confirmed?"
    t.boolean  "admin"
  end

  add_index "staff_members", ["email"], name: "index_staff_members_on_email", unique: true, using: :btree
  add_index "staff_members", ["reset_password_token"], name: "index_staff_members_on_reset_password_token", unique: true, using: :btree
  add_index "staff_members", ["school_id"], name: "index_staff_members_on_school_id", using: :btree

  create_table "student_parents", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "student_parents", ["parent_id"], name: "index_student_parents_on_parent_id", using: :btree
  add_index "student_parents", ["student_id"], name: "index_student_parents_on_student_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "osis_number"
    t.integer  "grade"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "meal_code"
    t.date     "birthdate"
    t.integer  "school_id"
    t.string   "phone"
  end

  add_index "students", ["last_name"], name: "index_students_on_last_name", using: :btree
  add_index "students", ["school_id"], name: "index_students_on_school_id", using: :btree

end
