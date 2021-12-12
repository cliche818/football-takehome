# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_12_194945) do

  create_table "player_rushing_stats", force: :cascade do |t|
    t.string "player_name"
    t.string "player_team"
    t.string "player_position"
    t.float "rushing_attempts_per_game_avg"
    t.integer "rushing_attempts"
    t.integer "total_rushing_yards"
    t.float "rushing_average_yards_per_attempt"
    t.float "rushing_yards_per_game"
    t.integer "total_rushing_touchdowns"
    t.integer "longest_rush"
    t.boolean "longest_rush_with_touchdown"
    t.integer "rushing_first_downs"
    t.float "rushing_first_down_percentage"
    t.integer "rushing_twenty_plus_yards"
    t.integer "rushing_forty_plus_yards"
    t.integer "rushing_fumbles"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["longest_rush"], name: "index_player_rushing_stats_on_longest_rush"
    t.index ["total_rushing_touchdowns"], name: "index_player_rushing_stats_on_total_rushing_touchdowns"
    t.index ["total_rushing_yards"], name: "index_player_rushing_stats_on_total_rushing_yards"
  end

  create_table "team_rushing_stats", force: :cascade do |t|
    t.string "player_team"
    t.integer "rushing_attempts"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "max_lng"
  end

end
