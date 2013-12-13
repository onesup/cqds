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

ActiveRecord::Schema.define(version: 20131017010454) do

  create_table "heroes", force: true do |t|
    t.integer  "total"
    t.integer  "user_id"
    t.integer  "wall_post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "heroes", ["user_id"], name: "index_heroes_on_user_id"
  add_index "heroes", ["wall_post_id"], name: "index_heroes_on_wall_post_id"

  create_table "tokens", force: true do |t|
    t.string   "access_token"
    t.text     "data"
    t.integer  "user_id"
    t.integer  "identifiable_id"
    t.string   "identifiable_type"
    t.datetime "expired_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tokens", ["identifiable_id", "identifiable_type"], name: "index_tokens_on_identifiable_id_and_identifiable_type"
  add_index "tokens", ["user_id"], name: "index_tokens_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "relationship"
    t.string   "profile_image"
    t.text     "data"
  end

  create_table "wall_posts", force: true do |t|
    t.text     "message"
    t.integer  "user_id"
    t.text     "options"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wall_posts", ["user_id"], name: "index_wall_posts_on_user_id"

end
