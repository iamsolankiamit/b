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

ActiveRecord::Schema.define(:version => 20130623091148) do

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "floods", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address"
    t.string   "city"
    t.string   "email"
    t.integer  "accommodates"
    t.decimal  "phone"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "offers", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "visiblity"
    t.string   "email"
    t.integer  "contact_phone",             :limit => 8
    t.integer  "contact_phone_backup",      :limit => 8
    t.string   "object_type"
    t.integer  "size"
    t.string   "size_type"
    t.integer  "bathroom_count"
    t.integer  "max_guest_count"
    t.integer  "bed_count"
    t.integer  "bedroom_count"
    t.string   "bed_type"
    t.boolean  "allow_marketing"
    t.string   "street"
    t.string   "street_no"
    t.string   "address_addon"
    t.string   "city"
    t.integer  "zip"
    t.string   "country_code_iso"
    t.string   "currency"
    t.float    "nightly_rate_amount"
    t.float    "weekly_rate_amount"
    t.float    "monthly_rate_amount"
    t.integer  "extra_guest_charge_amount"
    t.integer  "included_guest_count"
    t.integer  "service_charge_amount"
    t.string   "cancelation_policy"
    t.string   "min_nights"
    t.string   "max_nights"
    t.string   "checkin_after"
    t.string   "checkout_before"
    t.float    "confidential_lng"
    t.float    "confidential_lat"
    t.float    "geo_precision"
    t.boolean  "is_verified",                            :default => false
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
    t.boolean  "donate",                                 :default => false
    t.boolean  "full",                                   :default => false
  end

  create_table "photos", :force => true do |t|
    t.string   "offer_id"
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

# Could not dump table "pri_keys" because of following StandardError
#   Unknown type 'regclass' for column 'sequence'

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
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
    t.string   "offer_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",                  :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.string   "firstname"
    t.string   "lastname"
    t.string   "location"
    t.text     "about"
    t.string   "vat_company_name"
    t.string   "vat_country_iso"
    t.string   "role"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "phone",                  :limit => 8
    t.integer  "work_phone",             :limit => 8
    t.integer  "vat_id_number"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
