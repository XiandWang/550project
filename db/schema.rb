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

ActiveRecord::Schema.define(version: 20151102021733) do

  create_table "followships", force: :cascade do |t|
    t.integer  "follower_id", limit: 4
    t.integer  "followed_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "followships", ["followed_id"], name: "index_followships_on_followed_id", using: :btree
  add_index "followships", ["follower_id", "followed_id"], name: "index_followships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "followships", ["follower_id"], name: "index_followships_on_follower_id", using: :btree

  create_table "genres", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "genres", ["name"], name: "index_genres_on_name", unique: true, using: :btree

  create_table "movie_genres", force: :cascade do |t|
    t.integer  "movie_id",   limit: 4
    t.integer  "genre_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "movie_genres", ["genre_id"], name: "index_movie_genres_on_genre_id", using: :btree
  add_index "movie_genres", ["movie_id", "genre_id"], name: "index_movie_genres_on_movie_id_and_genre_id", unique: true, using: :btree
  add_index "movie_genres", ["movie_id"], name: "index_movie_genres_on_movie_id", using: :btree

  create_table "movies", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.string   "poster",       limit: 255
    t.decimal  "rating",                     precision: 10
    t.text     "overview",     limit: 65535
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "release_date", limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
