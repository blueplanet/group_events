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

ActiveRecord::Schema.define(version: 20130608093541) do

  create_table "events", force: true do |t|
    t.string   "title"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
    t.string   "location"
  end

  create_table "group_members", force: true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_members", ["group_id"], name: "index_group_members_on_group_id"
  add_index "group_members", ["user_id"], name: "index_group_members_on_user_id"

  create_table "group_users", force: true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_users", ["group_id"], name: "index_group_users_on_group_id"
  add_index "group_users", ["user_id"], name: "index_group_users_on_user_id"

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "img_url"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "img_url"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
