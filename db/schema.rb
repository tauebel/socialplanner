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

ActiveRecord::Schema.define(:version => 20121206043929) do

  create_table "acceptable_invites", :force => true do |t|
    t.integer  "event_id",                      :null => false
    t.integer  "fb_id",                         :null => false
    t.boolean  "invited",    :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "acceptable_invites", ["event_id", "fb_id"], :name => "index_acceptable_invites_on_event_id_and_fb_id", :unique => true

  create_table "comments", :force => true do |t|
    t.string   "body"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "event_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "accepted",   :default => false
  end

  create_table "events", :force => true do |t|
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "name"
    t.string   "description"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.string   "location"
    t.integer  "headcount_min"
    t.integer  "headcount_max"
    t.integer  "creator_id"
    t.boolean  "private",        :default => false
    t.integer  "fb_id"
  end

  create_table "friendships", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "friend_id"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
