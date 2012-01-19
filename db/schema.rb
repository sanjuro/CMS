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

ActiveRecord::Schema.define(:version => 20120104205515) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "client_types", :force => true do |t|
    t.string "title"
  end

  create_table "clients", :force => true do |t|
    t.integer  "client_type_id"
    t.integer  "industry_type_id"
    t.string   "client_number"
    t.string   "title"
    t.string   "initials"
    t.string   "name"
    t.string   "surname"
    t.string   "id_number"
    t.boolean  "is_smp",            :default => false
    t.string   "smp_number"
    t.string   "smp_rep_code"
    t.string   "telephone_home"
    t.string   "fax"
    t.string   "mobile_number_one"
    t.string   "mobile_number_two"
    t.string   "email_address"
    t.string   "unit_number"
    t.string   "street_name"
    t.string   "suburb"
    t.string   "city"
    t.string   "province"
    t.string   "postal_code"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients", ["client_number"], :name => "index_clients_on_client_number", :unique => true
  add_index "clients", ["smp_rep_code"], :name => "index_clients_on_smp_rep_code", :unique => true

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.string   "comment",                        :default => ""
    t.datetime "created_at",                                     :null => false
    t.integer  "commentable_id",                 :default => 0,  :null => false
    t.string   "commentable_type", :limit => 15, :default => "", :null => false
    t.integer  "user_id",                        :default => 0,  :null => false
  end

  add_index "comments", ["user_id"], :name => "fk_comments_user"

  create_table "industry_types", :force => true do |t|
    t.string "title"
  end

  create_table "installation_items", :force => true do |t|
    t.integer  "installation_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.decimal  "cost_price",      :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "selling_price",   :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "installation_items", ["installation_id"], :name => "index_installation_items_on_installation_id"
  add_index "installation_items", ["product_id"], :name => "index_installation_items_on_product_id"

  create_table "installation_types", :force => true do |t|
    t.string "title"
  end

  create_table "installations", :force => true do |t|
    t.integer  "installation_type_id"
    t.integer  "lnb_type_id"
    t.integer  "client_id"
    t.string   "installation_number"
    t.string   "client_number"
    t.string   "multichoice_number"
    t.string   "financial_number"
    t.string   "voucher_number"
    t.string   "decoder_number_one"
    t.string   "decoder_number_two"
    t.string   "smartcard_number_one"
    t.string   "smartcard_number_two"
    t.string   "lnb_no"
    t.decimal  "cost_total",           :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "selling_total",        :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.datetime "installation_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "installations", ["client_id"], :name => "index_installation_on_client"
  add_index "installations", ["installation_number"], :name => "index_installation_on_installation_number"

  create_table "installations_installers", :id => false, :force => true do |t|
    t.integer "installer_id"
    t.integer "installation_id"
  end

  create_table "installers", :force => true do |t|
    t.string   "installer_number"
    t.string   "name"
    t.string   "surname"
    t.string   "contact_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lnb_types", :force => true do |t|
    t.string "title"
  end

  create_table "product_types", :force => true do |t|
    t.string "title"
  end

  create_table "products", :force => true do |t|
    t.integer  "product_type_id"
    t.string   "product_name",                                      :default => "", :null => false
    t.string   "product_code"
    t.text     "product_description"
    t.decimal  "cost_price",          :precision => 8, :scale => 2
    t.decimal  "selling_price",       :precision => 8, :scale => 2,                 :null => false
    t.datetime "available_on"
    t.datetime "deleted_at"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "smp_reps", :force => true do |t|
    t.string   "smp_rep_code"
    t.string   "title"
    t.string   "name"
    t.string   "surname"
    t.string   "contact_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
