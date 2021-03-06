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

ActiveRecord::Schema.define(:version => 20120113224444) do

  create_table "busynesses", :force => true do |t|
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "busynesses_positions", :id => false, :force => true do |t|
    t.integer "busyness_id"
    t.integer "position_id"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "sphere_id"
    t.string   "info"
    t.string   "city"
    t.string   "url"
    t.string   "contact_person_name"
    t.string   "contact_person_phone"
    t.string   "contact_person_position"
    t.string   "contact_person_role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "cvs", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "salary"
    t.boolean  "relocation"
    t.string   "job_type"
    t.string   "experience"
    t.boolean  "private"
    t.boolean  "active"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experiences", :force => true do |t|
    t.string   "company"
    t.string   "city"
    t.string   "position"
    t.date     "date_start"
    t.date     "date_end"
    t.text     "description"
    t.integer  "cv_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "level"
    t.integer  "salary"
    t.integer  "busyness_id"
    t.integer  "education_id"
    t.string   "experience"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.boolean  "active"
    t.integer  "user_id"
  end

  create_table "positions_regions", :id => false, :force => true do |t|
    t.integer "position_id"
    t.integer "region_id"
  end

  create_table "positions_spheres", :id => false, :force => true do |t|
    t.integer "position_id"
    t.integer "sphere_id"
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spheres", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_details", :force => true do |t|
    t.integer  "sex",        :default => 0, :null => false
    t.string   "first_name",                :null => false
    t.string   "last_name",                 :null => false
    t.date     "birthday",                  :null => false
    t.string   "city",                      :null => false
    t.string   "phone",                     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "uid"
    t.string   "provider"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_company",                            :default => false, :null => false
    t.integer  "company_id"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
