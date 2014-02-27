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

ActiveRecord::Schema.define(version: 20140227022927) do

  create_table "bikes", force: true do |t|
    t.integer  "bike_id"
    t.boolean  "need_repair"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "checked_out"
    t.text     "problem_description"
    t.boolean  "passed_inspection"
    t.boolean  "addtional_repair_need"
    t.date     "last_date_inspected"
  end

  create_table "checked_outs", force: true do |t|
    t.integer  "user_id"
    t.integer  "bike_id"
    t.boolean  "fixed"
    t.text     "problem"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date_of_checkout"
    t.date     "date_of_checkin"
    t.time     "time_of_checkout"
    t.time     "time_of_checkin"
  end

  create_table "feedback_forms", force: true do |t|
    t.text     "feedback"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maintenance_reports", force: true do |t|
    t.integer  "user_id"
    t.integer  "bike_id"
    t.text     "report"
    t.text     "problem_before_maintenance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "addtional_repair_need"
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories"

  create_table "survey_answers", force: true do |t|
    t.integer  "attempt_id"
    t.integer  "question_id"
    t.integer  "option_id"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_attempts", force: true do |t|
    t.integer "participant_id"
    t.string  "participant_type"
    t.integer "survey_id"
    t.boolean "winner"
    t.integer "score"
  end

  create_table "survey_options", force: true do |t|
    t.integer  "question_id"
    t.integer  "weight",      default: 0
    t.string   "text"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_questions", force: true do |t|
    t.integer  "survey_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_surveys", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "attempts_number", default: 0
    t.boolean  "finished",        default: false
    t.boolean  "active",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: true do |t|
    t.date     "date_of_charge"
    t.float    "charge_amount"
    t.string   "description_of_charge"
    t.boolean  "pending"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "login",               default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "email"
    t.boolean  "registered"
    t.string   "role"
    t.integer  "roles_mask"
    t.boolean  "repairman"
    t.boolean  "checkout_person"
  end

  add_index "users", ["login"], name: "index_users_on_login", unique: true

end
