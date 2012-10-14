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

ActiveRecord::Schema.define(:version => 20121014205132) do

  create_table "campaign_faqs", :force => true do |t|
    t.integer  "campaign_id"
    t.string   "question",                   :null => false
    t.string   "answer",                     :null => false
    t.integer  "sort_order",  :default => 0
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "campaign_levels", :force => true do |t|
    t.integer  "campaign_id"
    t.string   "title",                                     :null => false
    t.decimal  "cost",        :precision => 8, :scale => 2, :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.text     "description"
  end

  create_table "campaign_sections", :force => true do |t|
    t.integer  "campaign_id"
    t.string   "title",                                           :null => false
    t.text     "text",                                            :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "sort_order",                       :default => 0
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.string   "type",               :limit => 19
  end

  create_table "campaigns", :force => true do |t|
    t.string   "name",                                                              :null => false
    t.decimal  "goal",              :precision => 8, :scale => 2,                   :null => false
    t.string   "domain"
    t.string   "tagline"
    t.string   "secondary_tagline"
    t.text     "blurb"
    t.datetime "start_time"
    t.integer  "user_id"
    t.boolean  "show_link",                                       :default => true
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
    t.text     "video"
    t.text     "image_url"
  end

  create_table "order_metadata", :force => true do |t|
    t.integer  "order_id"
    t.string   "field"
    t.text     "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :id => false, :force => true do |t|
    t.string   "address_one"
    t.string   "address_two"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.decimal  "price",             :precision => 10, :scale => 0
    t.string   "phone"
    t.string   "name"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.string   "card_id"
    t.string   "transaction_id"
    t.string   "email"
    t.integer  "campaign_level_id"
    t.integer  "campaign_id"
  end

  add_index "orders", ["campaign_id"], :name => "index_orders_on_campaign_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean  "stripe_livemode",        :default => false
    t.string   "stripe_publishable_key"
    t.string   "stripe_user_id"
    t.string   "stripe_refresh_token"
    t.string   "stripe_access_token"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
