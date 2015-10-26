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

ActiveRecord::Schema.define(version: 20151026013257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "created_by_user_id"
    t.string   "location"
    t.time     "start_time"
    t.time     "end_time"
    t.date     "event_date"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "description"
    t.string   "title"
  end

  create_table "games", force: :cascade do |t|
    t.integer  "team_id"
    t.string   "location"
    t.date     "game_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "opponent_name"
    t.integer  "team_score"
    t.integer  "opponent_score"
    t.time     "start_time"
    t.time     "end_time"
  end

  add_index "games", ["team_id"], name: "index_games_on_team_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "amount_cents",    default: 0,     null: false
    t.string   "amount_currency", default: "USD", null: false
    t.string   "description"
    t.string   "title"
    t.datetime "due_date"
    t.boolean  "paid_in_full",    default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "payments", ["team_id"], name: "index_payments_on_team_id", using: :btree

  create_table "practices", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "location"
    t.date     "practice_date"
    t.integer  "team_id"
    t.time     "start_time"
    t.time     "end_time"
  end

  add_index "practices", ["team_id"], name: "index_practices_on_team_id", using: :btree

  create_table "roster_invites", force: :cascade do |t|
    t.string   "email"
    t.integer  "team_roster_id"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.string   "token"
    t.boolean  "captain"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "rosters", force: :cascade do |t|
    t.boolean  "captain"
    t.integer  "team_roster_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "team_rosters", force: :cascade do |t|
    t.string   "name"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "current"
  end

  add_index "team_rosters", ["team_id"], name: "index_team_rosters_on_team_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.string   "location"
    t.string   "league"
    t.integer  "team_admin_id"
  end

  add_index "teams", ["name"], name: "index_teams_on_name", using: :btree

  create_table "user_payments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "payment_id"
    t.integer  "amount_due_cents",     default: 0,     null: false
    t.string   "amount_due_currency",  default: "USD", null: false
    t.integer  "amount_paid_cents",    default: 0,     null: false
    t.string   "amount_paid_currency", default: "USD", null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "user_payments", ["payment_id"], name: "index_user_payments_on_payment_id", using: :btree
  add_index "user_payments", ["user_id"], name: "index_user_payments_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "years_playing"
    t.text     "bio"
    t.string   "position"
    t.string   "location"
    t.datetime "date_of_birth"
    t.boolean  "is_female",              default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
