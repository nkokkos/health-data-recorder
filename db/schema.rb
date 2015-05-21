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

ActiveRecord::Schema.define(version: 20150515124423) do

  create_table "chronic_diseases", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chronic_diseases_users", id: false, force: :cascade do |t|
    t.integer "user_id",            limit: 4, null: false
    t.integer "chronic_disease_id", limit: 4, null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "education_levels", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description", limit: 255
  end

  create_table "employment_statuses", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercise_activities", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "family_statuses", force: :cascade do |t|
    t.string   "status",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "measurement_blocks", force: :cascade do |t|
    t.time     "time_tag"
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "measurement_blocks", ["user_id"], name: "index_measurement_blocks_on_user_id", using: :btree

  create_table "measurements", force: :cascade do |t|
    t.float    "measure_value",        limit: 24
    t.integer  "device_id",            limit: 4
    t.integer  "measure_id",           limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "measurement_block_id", limit: 4
  end

  add_index "measurements", ["device_id"], name: "index_measurements_on_device_id", using: :btree
  add_index "measurements", ["measure_id"], name: "index_measurements_on_measure_id", using: :btree
  add_index "measurements", ["measurement_block_id"], name: "fk_rails_e2e59b8122", using: :btree

  create_table "measures", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "device_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "measures", ["device_id"], name: "index_measures_on_device_id", using: :btree

  create_table "patient_relationships", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "patient_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "sexes", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "smoking_frequencies", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               limit: 255
    t.boolean  "active",                 limit: 1
    t.boolean  "admin",                  limit: 1
    t.integer  "sex_id",                 limit: 4
    t.string   "rfid_tag",               limit: 255
    t.boolean  "is_smoker",              limit: 1
    t.boolean  "exercises",              limit: 1
    t.integer  "family_status_id",       limit: 4
    t.date     "birth_date"
    t.integer  "height",                 limit: 4,     default: 0
    t.integer  "education_level_id",     limit: 4
    t.integer  "exercise_activity_id",   limit: 4
    t.integer  "smoking_frequency_id",   limit: 4
    t.integer  "employment_status_id",   limit: 4
    t.text     "additional_info",        limit: 65535
    t.string   "access_id",              limit: 255
    t.integer  "role",                   limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "measurement_blocks", "users"
  add_foreign_key "measurements", "measurement_blocks"
end
