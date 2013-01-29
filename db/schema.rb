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

ActiveRecord::Schema.define(:version => 20130129063242) do

  create_table "branches_campaigns", :id => false, :force => true do |t|
    t.integer "campaign_id", :precision => 38, :scale => 0
    t.integer "branch_id",   :precision => 38, :scale => 0
  end

  add_index "branches_campaigns", ["branch_id", "campaign_id"], :name => "i_bra_cam_bra_id_cam_id"
  add_index "branches_campaigns", ["campaign_id", "branch_id"], :name => "i_bra_cam_cam_id_bra_id"

  create_table "campaigns", :force => true do |t|
    t.string   "campaign_name"
    t.integer  "impression_id",      :precision => 38, :scale => 0
    t.integer  "impression_count",   :precision => 38, :scale => 0
    t.datetime "start_date"
    t.string   "time_frame"
    t.integer  "user_id",            :precision => 38, :scale => 0
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size",    :precision => 38, :scale => 0
    t.datetime "photo_updated_at"
  end

  create_table "impressions", :force => true do |t|
    t.string   "name"
    t.integer  "impression_count", :precision => 38, :scale => 0
    t.integer  "user_id",          :precision => 38, :scale => 0
    t.integer  "paid_amount",      :precision => 38, :scale => 0
    t.string   "payment_type"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                                 :default => "", :null => false
    t.string   "encrypted_password",                                    :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :precision => 38, :scale => 0, :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                            :null => false
    t.datetime "updated_at",                                                            :null => false
    t.string   "name"
    t.string   "company"
    t.string   "jb_membership"
    t.string   "phonenumber"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "i_users_reset_password_token", :unique => true

end
