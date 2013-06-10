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

ActiveRecord::Schema.define(:version => 20130609111545) do

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "offers", :force => true do |t|
    t.boolean  "visiblity",                                :default => false, :null => false
    t.string   "email"
    t.integer  "contact_phone",             :limit => 255
    t.integer  "contact_phone_backup",      :limit => 255
    t.string   "object_type"
    t.integer  "size",                      :limit => 255
    t.string   "size_type"
    t.integer  "bathroom_count",            :limit => 255
    t.integer  "max_guest_count",           :limit => 255
    t.integer  "bed_count",                 :limit => 255
    t.integer  "bedroom_count",             :limit => 255
    t.string   "bed_type"
    t.boolean  "allow_marketing",                          :default => true
    t.string   "street"
    t.string   "street_no"
    t.string   "address_addon"
    t.string   "city"
    t.integer  "zip",                       :limit => 255
    t.string   "country_code_iso"
    t.string   "currency"
    t.float    "nightly_rate_amount",       :limit => 255
    t.float    "weekly_rate_amount",        :limit => 255
    t.float    "monthly_rate_amount",       :limit => 255
    t.integer  "extra_guest_charge_amount", :limit => 255
    t.integer  "included_guest_count",      :limit => 255
    t.integer  "service_charge_amount",     :limit => 255
    t.string   "cancelation_policy"
    t.integer  "min_nights",                :limit => 255
    t.integer  "max_nights",                :limit => 255
    t.string   "checkin_after"
    t.string   "checkout_before"
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
    t.integer  "user_id"
    t.boolean  "is_verified",                              :default => false
  end

  create_table "photos", :force => true do |t|
    t.text     "description"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "offer_id"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "translations", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "rules"
    t.string   "locale"
    t.string   "title_translated_by_google"
    t.text     "description_translated_by_google"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "offer_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "firstname"
    t.string   "lastname"
    t.string   "phone"
    t.string   "work_phone"
    t.string   "location"
    t.text     "about"
    t.string   "vat_id_number"
    t.string   "vat_company_name"
    t.string   "vat_country_iso"
    t.string   "role"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
