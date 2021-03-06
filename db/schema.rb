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

ActiveRecord::Schema.define(version: 20161212143327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agendas", force: :cascade do |t|
    t.string   "name"
    t.integer  "disabled_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
    t.index ["disabled_id"], name: "index_agendas_on_disabled_id", using: :btree
  end

  create_table "boards", force: :cascade do |t|
    t.string   "name"
    t.integer  "agenda_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
    t.index ["agenda_id"], name: "index_boards_on_agenda_id", using: :btree
  end

  create_table "boards_pictograms", force: :cascade do |t|
    t.integer "board_id"
    t.integer "pictogram_id"
    t.index ["board_id"], name: "index_boards_pictograms_on_board_id", using: :btree
    t.index ["pictogram_id"], name: "index_boards_pictograms_on_pictogram_id", using: :btree
  end

  create_table "disableds", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "professional_id"
    t.integer  "guide_id"
    t.index ["guide_id"], name: "index_disableds_on_guide_id", using: :btree
    t.index ["professional_id"], name: "index_disableds_on_professional_id", using: :btree
  end

  create_table "pictograms", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "agendas", "disableds"
  add_foreign_key "boards", "agendas"
end
