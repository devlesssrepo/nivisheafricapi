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

ActiveRecord::Schema.define(version: 20160403111218) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "keyword",                null: false
    t.integer  "segment",    default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "collections", force: :cascade do |t|
    t.string   "name",                        null: false
    t.integer  "designer_id",                 null: false
    t.boolean  "is_available", default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",                          null: false
    t.string   "code",                          null: false
    t.string   "continent",  default: "Africa"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_address",                     null: false
    t.string   "phone_number",                      null: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.string   "password_digest"
    t.string   "reset_digest"
    t.datetime "activated_at"
    t.datetime "reset_sent_at"
    t.string   "shipping_address"
    t.integer  "country_id"
    t.string   "stripe_card_token"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "designers", force: :cascade do |t|
    t.string   "design_label",                      null: false
    t.string   "first_name",                        null: false
    t.string   "last_name"
    t.string   "phone_number",                      null: false
    t.string   "email_address",                     null: false
    t.string   "physical_address"
    t.integer  "country_id"
    t.string   "logo"
    t.string   "about_notes"
    t.string   "size_url"
    t.string   "password_digest"
    t.string   "activation_digest"
    t.string   "reset_digest"
    t.boolean  "activated",         default: false
    t.boolean  "admin",             default: false
    t.datetime "activated_at"
    t.datetime "reset_sent_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "mail_lists", force: :cascade do |t|
    t.string   "email_address", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.decimal  "unit_price", precision: 6,  scale: 2
    t.integer  "quantity"
    t.decimal  "price_sum",  precision: 11, scale: 2
    t.string   "size"
    t.string   "colour"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "quantity_total",                             default: 0
    t.decimal  "subtotal",          precision: 11, scale: 2,                 null: false
    t.decimal  "shipping_cost",     precision: 11, scale: 2, default: "0.0"
    t.integer  "status",                                     default: 1
    t.integer  "payment_id"
    t.datetime "expected_del_date"
    t.datetime "dispatch_date"
    t.integer  "courier_id"
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "customer_token"
    t.decimal  "amount_paid",    precision: 11, scale: 2
    t.decimal  "amount_owed",    precision: 11, scale: 2
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "product_details", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "colour"
    t.string   "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "category_id",                                            null: false
    t.integer  "collection_id",                                          null: false
    t.string   "label",                                                  null: false
    t.string   "description"
    t.string   "code",                                                   null: false
    t.decimal  "unit_price",     precision: 6, scale: 2,                 null: false
    t.float    "weight"
    t.integer  "quantity_total"
    t.integer  "quantity_sold"
    t.boolean  "is_available",                           default: true
    t.string   "pictures",                                               null: false, array: true
    t.boolean  "is_featured",                            default: false
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

end
