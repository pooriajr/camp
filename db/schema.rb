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

ActiveRecord::Schema[7.0].define(version: 2023_09_14_230813) do
  create_table "campers", force: :cascade do |t|
    t.string "name"
    t.string "aka"
    t.string "project"
    t.string "project_description"
    t.string "project_status"
    t.string "project_url"
    t.text "stats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "progresses", force: :cascade do |t|
    t.integer "camper_id", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camper_id"], name: "index_progresses_on_camper_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "camper_id", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camper_id"], name: "index_reports_on_camper_id"
  end

  create_table "updates", force: :cascade do |t|
    t.integer "camper_id", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camper_id"], name: "index_updates_on_camper_id"
  end

  add_foreign_key "progresses", "campers"
  add_foreign_key "reports", "campers"
  add_foreign_key "updates", "campers"
end
