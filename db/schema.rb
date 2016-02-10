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

ActiveRecord::Schema.define(version: 20160210032525) do

  create_table "contracts", force: :cascade do |t|
    t.integer  "length"
    t.integer  "start_year"
    t.integer  "fa_status"
    t.integer  "contract_status"
    t.integer  "player_id"
    t.integer  "fantasy_team_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.float    "year_1_salary"
    t.float    "year_2_salary"
    t.float    "year_3_salary"
    t.float    "year_4_salary"
  end

  add_index "contracts", ["contract_status"], name: "index_contracts_on_contract_status"
  add_index "contracts", ["fa_status"], name: "index_contracts_on_fa_status"
  add_index "contracts", ["fantasy_team_id"], name: "index_contracts_on_fantasy_team_id"
  add_index "contracts", ["player_id"], name: "index_contracts_on_player_id"

  create_table "draft_picks", force: :cascade do |t|
    t.integer  "year"
    t.integer  "round"
    t.string   "pick"
    t.integer  "fantasy_team_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "comments"
  end

  add_index "draft_picks", ["fantasy_team_id"], name: "index_draft_picks_on_fantasy_team_id"
  add_index "draft_picks", ["year"], name: "index_draft_picks_on_year"

  create_table "fantasy_teams", force: :cascade do |t|
    t.string   "owner_name"
    t.string   "team_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "abbreviation"
    t.integer  "espn_id"
  end

  add_index "fantasy_teams", ["abbreviation"], name: "index_fantasy_teams_on_abbreviation", unique: true

  create_table "players", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nfl_team_name"
    t.string   "position"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "bye_week"
  end

  add_index "players", ["nfl_team_name"], name: "index_players_on_nfl_team_name"
  add_index "players", ["position"], name: "index_players_on_position"

end
