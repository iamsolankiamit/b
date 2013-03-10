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

ActiveRecord::Schema.define(:version => 20130307150100) do

  create_table "addresses", :force => true do |t|
    t.string   "street"
    t.string   "address_line_2"
    t.string   "city"
    t.integer  "zip"
    t.string   "country_iso"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "details", :force => true do |t|
    t.string   "email"
    t.integer  "phone"
    t.integer  "alternate"
    t.integer  "size"
    t.string   "property_type"
    t.integer  "bathrooms"
    t.integer  "accomodation"
    t.integer  "beds"
    t.integer  "bedroom"
    t.string   "bed_tpye"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "offers", :force => true do |t|
    t.boolean  "available"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photos", :force => true do |t|
    t.string   "aws_path"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "pricings", :force => true do |t|
    t.decimal  "night"
    t.decimal  "week"
    t.decimal  "month"
    t.decimal  "extra_on_person"
    t.decimal  "cleaning"
    t.integer  "extra_after"
    t.integer  "min_stay"
    t.integer  "max_stay"
    t.string   "cancellation_policy"
    t.integer  "checkin_after"
    t.integer  "checkout_before"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "translations", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "lang"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
