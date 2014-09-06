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

ActiveRecord::Schema.define(version: 20140906170556) do

  create_table "project_finance_costs", force: true do |t|
    t.string   "name"
    t.float    "money"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
  end

  add_index "project_finance_costs", ["project_id"], name: "index_project_finance_costs_on_project_id"

  create_table "project_materials", force: true do |t|
    t.string   "name"
    t.float    "quantity"
    t.string   "measure"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
  end

  add_index "project_materials", ["project_id"], name: "index_project_materials_on_project_id"

  create_table "project_people_times", force: true do |t|
    t.string   "name"
    t.string   "day"
    t.string   "integer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
  end

  add_index "project_people_times", ["project_id"], name: "index_project_people_times_on_project_id"

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "status"
    t.string   "date_to"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "place"
    t.string   "video"
    t.integer  "user_id"
    t.string   "photo"
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
