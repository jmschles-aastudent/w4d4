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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130606231358) do

  create_table "albums", :force => true do |t|
    t.string   "name"
    t.integer  "year"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "band_id"
    t.string   "recording_type"
  end

  create_table "bands", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "notes", :force => true do |t|
    t.string   "text"
    t.integer  "track_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tracks", :force => true do |t|
    t.string   "title"
    t.integer  "ord"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "lyrics"
    t.boolean  "bonus"
    t.integer  "album_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "activated"
    t.string   "user_type"
    t.string   "session_token"
    t.string   "activation_token"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
