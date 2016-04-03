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

ActiveRecord::Schema.define(version: 20160122102045) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "topic"
    t.string   "preview"
    t.text     "body"
    t.integer  "like_counter",             default: 0
    t.integer  "view_counter",             default: 0
    t.integer  "comment_counter",          default: 0
    t.boolean  "ended",                    default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "article_pic_file_name"
    t.string   "article_pic_content_type"
    t.integer  "article_pic_file_size"
    t.datetime "article_pic_updated_at"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["article_id"], name: "index_likes_on_article_id", using: :btree
  add_index "likes", ["comment_id"], name: "index_likes_on_comment_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "shiny_comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "likes",      default: 0
    t.integer  "article_id"
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "shiny_comments", ["article_id"], name: "index_shiny_comments_on_article_id", using: :btree
  add_index "shiny_comments", ["comment_id"], name: "index_shiny_comments_on_comment_id", using: :btree
  add_index "shiny_comments", ["user_id"], name: "index_shiny_comments_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                    default: "",          null: false
    t.string   "encrypted_password",       default: "",          null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,           null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "profile_pic_file_name"
    t.string   "profile_pic_content_type"
    t.integer  "profile_pic_file_size"
    t.datetime "profile_pic_updated_at"
    t.string   "nick_name",                default: "Anonymous"
    t.integer  "likes_counter",            default: 0
    t.integer  "comments_counter",         default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "views", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "client_ip"
  end

  add_index "views", ["article_id"], name: "index_views_on_article_id", using: :btree
  add_index "views", ["user_id"], name: "index_views_on_user_id", using: :btree

end
