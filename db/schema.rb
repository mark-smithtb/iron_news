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

ActiveRecord::Schema.define(version: 3) do

  create_table "comments", force: :cascade do |t|
    t.string   "comment",    null: false
    t.integer  "writer_id"
    t.integer  "story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", force: :cascade do |t|
    t.string   "title",         null: false
    t.string   "link",          null: false
    t.integer  "score"
    t.integer  "comment_count"
    t.integer  "writer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "writers", force: :cascade do |t|
    t.string "name",  null: false
    t.string "email", null: false
  end

end
