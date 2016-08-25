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

ActiveRecord::Schema.define(version: 20160823131857) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "payment_method_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string   "email"
    t.string   "card_number"
    t.string   "security_code"
    t.string   "expiration_month"
    t.string   "expiration_year"
    t.string   "card_holder"
    t.string   "doc_type"
    t.string   "doc_number"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "amount"
  end

  create_table "payments_products", id: false, force: :cascade do |t|
    t.integer "payment_id", null: false
    t.integer "product_id", null: false
  end

  add_index "payments_products", ["payment_id", "product_id"], name: "index_payments_products_on_payment_id_and_product_id"
  add_index "payments_products", ["product_id", "payment_id"], name: "index_payments_products_on_product_id_and_payment_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "price"
    t.integer  "stock"
    t.integer  "code"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "picture"
    t.boolean  "offer"
    t.string   "cover_picture"
    t.integer  "category_id"
    t.integer  "trademark_id"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id"
  add_index "products", ["trademark_id"], name: "index_products_on_trademark_id"

  create_table "trademarks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.boolean  "subscription"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
