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

ActiveRecord::Schema.define(version: 20170525041916) do

  create_table "blinds", force: :cascade do |t|
    t.string   "first_name"
    t.string   "second_name"
    t.string   "first_lastname"
    t.string   "second_lastname"
    t.string   "lastname_married"
    t.string   "civil_status"
    t.string   "address"
    t.string   "zone"
    t.string   "province"
    t.string   "department",          default: "cochabamba"
    t.string   "nationality"
    t.string   "language"
    t.date     "registration_date"
    t.date     "birthday"
    t.string   "country_birth"
    t.string   "city_birth"
    t.string   "province_birth"
    t.string   "ci"
    t.integer  "cellphone"
    t.string   "beneficiary_income"
    t.string   "current_occupation"
    t.string   "previous_occupation"
    t.string   "degree_instruction"
    t.string   "other_studies"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "sex"
    t.boolean  "original",            default: false
    t.string   "status"
  end

  create_table "familiars", force: :cascade do |t|
    t.string   "relationship"
    t.string   "names"
    t.string   "first_lastname"
    t.string   "second_lastname"
    t.string   "degree_instruction"
    t.string   "occupation"
    t.string   "disability"
    t.date     "birthday"
    t.string   "observation"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "blind_id"
    t.integer  "cellphone"
  end

  add_index "familiars", ["blind_id"], name: "index_familiars_on_blind_id"

  create_table "homes", force: :cascade do |t|
    t.string   "zone"
    t.string   "services"
    t.string   "tenecia"
    t.string   "accessibility"
    t.integer  "rooms"
    t.boolean  "bathroom?"
    t.boolean  "kitchen?"
    t.string   "wall_type"
    t.string   "roof_type"
    t.string   "floor_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "blind_id"
    t.string   "home_type"
  end

  add_index "homes", ["blind_id"], name: "index_homes_on_blind_id"

  create_table "medicals", force: :cascade do |t|
    t.string   "type_blindness"
    t.string   "causes_blindness"
    t.string   "time_blindness"
    t.string   "general_diagnosis"
    t.string   "medical_attention_place"
    t.string   "additional_disability"
    t.boolean  "health_insurance?"
    t.string   "name_health_insurance"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "blind_id"
  end

  add_index "medicals", ["blind_id"], name: "index_medicals_on_blind_id"

  create_table "publications", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.date     "initialDate"
    t.date     "finalDate"
    t.boolean  "showP"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image_path"
  end

  create_table "rehabilitations", force: :cascade do |t|
    t.boolean  "received?"
    t.string   "place"
    t.date     "first_date"
    t.date     "last_date"
    t.string   "type_rehab"
    t.string   "training_skils"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "blind_id"
  end

  add_index "rehabilitations", ["blind_id"], name: "index_rehabilitations_on_blind_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "users", force: :cascade do |t|
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
    t.string   "name"
    t.string   "lastname"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
