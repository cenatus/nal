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

ActiveRecord::Schema.define(:version => 20110330235250) do

  create_table "admin_users", :force => true do |t|
    t.string   "first_name",       :default => "",    :null => false
    t.string   "last_name",        :default => "",    :null => false
    t.string   "role",                                :null => false
    t.string   "email",                               :null => false
    t.boolean  "status",           :default => false
    t.string   "token",                               :null => false
    t.string   "salt",                                :null => false
    t.string   "crypted_password",                    :null => false
    t.string   "preferences"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "venue"
    t.date     "date"
    t.text     "summary"
    t.text     "detail"
    t.string   "year"
    t.integer  "strand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_items", :force => true do |t|
    t.string   "headline"
    t.text     "summary"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "year"
    t.text     "content"
  end

  create_table "participants", :force => true do |t|
    t.string   "name"
    t.text     "biography"
    t.string   "homepage"
    t.string   "twitter_name"
    t.integer  "event_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "year"
  end

  create_table "strands", :force => true do |t|
    t.string   "name"
    t.text     "summary"
    t.text     "detail"
    t.string   "year"
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
