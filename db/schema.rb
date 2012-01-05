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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120105221724) do

  create_table "available_boardgames", :force => true do |t|
    t.integer  "collection_id"
    t.integer  "meetup_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "boardgames", :force => true do |t|
    t.integer  "bgg_id"
    t.string   "name"
    t.integer  "parent_boardgame_id"
    t.boolean  "is_standalone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "collections", :force => true do |t|
    t.integer  "player_id"
    t.integer  "boardgame_id"
    t.text     "bought_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "game_sessions", :force => true do |t|
    t.integer  "player_id"
    t.integer  "game_id"
    t.integer  "turn_number"
    t.integer  "round_number"
    t.time     "turn_time"
    t.time     "time_bank"
    t.time     "time_taken_so_far"
    t.integer  "turn_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.time     "time_per_turn",       :default => '2000-01-01 00:03:00'
    t.time     "timebank_per_player", :default => '2000-01-01 00:10:00'
    t.time     "game_time",           :default => '2000-01-01 00:00:00'
    t.integer  "turn_number",         :default => 0
    t.integer  "round_number",        :default => 0
    t.time     "interlude_per_turn",  :default => '2000-01-01 00:00:03'
    t.integer  "number_of_players"
    t.string   "name"
    t.datetime "ended_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "first_type",          :default => 0
  end

  create_table "meetups", :force => true do |t|
    t.integer  "host_player_id"
    t.date     "confirmed_date"
    t.time     "confirmed_time"
    t.text     "confirmed_venue"
    t.string   "meetup_type"
    t.text     "venue_link"
    t.string   "invitation_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meetups_players", :force => true do |t|
    t.integer  "meetup_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "colour"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proposed_timings", :force => true do |t|
    t.integer  "meetup_id"
    t.integer  "proposed_by_player"
    t.date     "proposed_date"
    t.time     "proposed_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proposed_venues", :force => true do |t|
    t.integer  "meetup_id"
    t.integer  "proposed_by_player"
    t.text     "description"
    t.text     "venue_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
