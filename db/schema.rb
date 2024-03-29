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

ActiveRecord::Schema.define(version: 20180730211607) do

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "person_id"
    t.index ["event_id"], name: "index_comments_on_event_id"
    t.index ["person_id"], name: "index_comments_on_person_id"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "project_id"
    t.integer  "person_id"
    t.boolean  "complete",    default: false
    t.datetime "deadline",    default: '2017-03-30 00:00:00'
    t.boolean  "recur"
    t.string   "recur_often"
    t.integer  "recur_times"
    t.index ["person_id"], name: "index_events_on_person_id"
    t.index ["project_id"], name: "index_events_on_project_id"
  end

  create_table "people", force: :cascade do |t|
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
    t.boolean  "manager"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "carrier"
    t.integer  "painting_skill"
    t.integer  "hanging_skill"
    t.integer  "packing_skill"
    t.integer  "tech_skill"
    t.integer  "renu_skill"
    t.integer  "batch_skill"
    t.integer  "harley_skill"
    t.integer  "forklift_skill"
    t.integer  "welding_skill"
    t.integer  "maintenance_skill"
    t.integer  "wash_skill"
    t.integer  "year_started"
    t.integer  "communication"
    t.index ["email"], name: "index_people_on_email", unique: true
    t.index ["reset_password_token"], name: "index_people_on_reset_password_token", unique: true
  end

  create_table "people_projects", id: false, force: :cascade do |t|
    t.integer "person_id"
    t.integer "project_id"
    t.index ["person_id"], name: "index_people_projects_on_person_id"
    t.index ["project_id"], name: "index_people_projects_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "creator_id"
    t.boolean  "archived",    default: false
  end

end
