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

ActiveRecord::Schema.define(version: 20170417235811) do

  create_table "articles", force: :cascade do |t|
    t.string   "Title",                 limit: 255
    t.string   "Constant",              limit: 255
    t.integer  "user_id",               limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "document_file_name",    limit: 255
    t.string   "document_content_type", limit: 255
    t.integer  "document_file_size",    limit: 4
    t.datetime "document_updated_at"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "books", force: :cascade do |t|
    t.string   "BookName",   limit: 255
    t.integer  "recipte_id", limit: 4
    t.integer  "cooker_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "books", ["cooker_id"], name: "index_books_on_cooker_id", using: :btree
  add_index "books", ["recipte_id"], name: "index_books_on_recipte_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "text",                  limit: 255
    t.integer  "user_id",               limit: 4
    t.integer  "article_id",            limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "document_file_name",    limit: 255
    t.string   "document_content_type", limit: 255
    t.integer  "document_file_size",    limit: 4
    t.datetime "document_updated_at"
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "cookers", force: :cascade do |t|
    t.string   "Name",       limit: 255
    t.integer  "recipte_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "cookers", ["recipte_id"], name: "index_cookers_on_recipte_id", using: :btree

  create_table "logins", force: :cascade do |t|
    t.string   "Email",           limit: 255
    t.string   "Name",            limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "microposts", force: :cascade do |t|
    t.string   "content",    limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at", using: :btree

  create_table "posters", force: :cascade do |t|
    t.string   "Title",                 limit: 255
    t.string   "Content",               limit: 255
    t.integer  "signup_id",             limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "document_file_name",    limit: 255
    t.string   "document_content_type", limit: 255
    t.integer  "document_file_size",    limit: 4
    t.datetime "document_updated_at"
  end

  add_index "posters", ["signup_id"], name: "index_posters_on_signup_id", using: :btree

  create_table "reciptes", force: :cascade do |t|
    t.string   "Name",       limit: 255
    t.string   "score",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "signups", force: :cascade do |t|
    t.string   "Email",           limit: 255
    t.string   "Name",            limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "Email",           limit: 255
    t.string   "Name",            limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_foreign_key "articles", "users"
  add_foreign_key "books", "cookers"
  add_foreign_key "books", "reciptes"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users"
  add_foreign_key "cookers", "reciptes"
  add_foreign_key "posters", "signups"
end
