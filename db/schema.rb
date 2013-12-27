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

ActiveRecord::Schema.define(version: 20131227205529) do

  create_table "bikes", force: true do |t|
    t.integer  "bike_id"
    t.boolean  "need_repair"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "other_users", force: true do |t|
    t.integer  "rit_user_id"
    t.string   "other_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rit_users", force: true do |t|
    t.integer  "user_id"
    t.string   "rit_email"
    t.boolean  "admin"
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
  end

  add_index "users", ["login"], name: "index_users_on_login", unique: true

end
