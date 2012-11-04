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

ActiveRecord::Schema.define(:version => 20121104041617) do

  create_table "organizations", :force => true do |t|
    t.string   "name",          :null => false
    t.string   "slug",          :null => false
    t.string   "url",           :null => false
    t.integer  "created_by_id", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "organizations", ["slug"], :name => "index_organizations_on_slug"

  create_table "publications", :force => true do |t|
    t.integer  "report_id",  :null => false
    t.string   "name",       :null => false
    t.string   "slug",       :null => false
    t.string   "url",        :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "publications", ["report_id"], :name => "index_publications_on_report_id"

  create_table "reports", :force => true do |t|
    t.integer  "organization_id"
    t.integer  "created_by_id",   :null => false
    t.string   "name",            :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "url"
  end

  add_index "reports", ["created_by_id"], :name => "index_reports_on_created_by_id"
  add_index "reports", ["organization_id"], :name => "index_reports_on_organization_id"

  create_table "users", :force => true do |t|
    t.string   "username",         :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_foreign_key "organizations", "users", :name => "organizations_created_by_id_fk", :column => "created_by_id"

  add_foreign_key "publications", "reports", :name => "publications_report_id_fk"

end
