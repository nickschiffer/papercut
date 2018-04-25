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

ActiveRecord::Schema.define(version: 20180425033657) do

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "condition"
    t.string "ISBN"
    t.integer "user_id"
    t.float "value", default: 0.0
    t.boolean "visibility", default: true
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["ISBN"], name: "index_books_on_ISBN"
    t.index ["author"], name: "index_books_on_author"
    t.index ["post_id"], name: "index_books_on_post_id"
    t.index ["title"], name: "index_books_on_title"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "slug"
    t.integer "user_id"
    t.string "image"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_posts_on_slug", unique: true
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.string "buyer_id"
    t.string "buyer_firstname"
    t.string "buyer_lastname"
    t.string "buyer_email"
    t.string "seller_id"
    t.string "seller_firstname"
    t.string "seller_lastname"
    t.string "seller_email"
    t.string "book_title"
    t.string "book_author"
    t.string "book_isbn"
    t.string "trade_title"
    t.string "trade_author"
    t.string "trade_isbn"
    t.string "payment_menthod"
    t.float "amount", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "replies", force: :cascade do |t|
    t.text "body"
    t.string "slug"
    t.integer "post_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_replies_on_post_id"
    t.index ["slug"], name: "index_replies_on_slug", unique: true
    t.index ["user_id"], name: "index_replies_on_user_id"
  end

  create_table "sales", force: :cascade do |t|
    t.integer "buyer_id"
    t.integer "seller_id"
    t.integer "book_id"
    t.integer "trade_id"
    t.integer "state", default: 0
    t.boolean "verified_by_buyer", default: false
    t.boolean "verified_by_seller", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
