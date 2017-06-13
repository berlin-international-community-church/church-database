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

ActiveRecord::Schema.define(version: 20170613192739) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "street_number"
    t.string   "zip_code"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "member_id"
    t.index ["member_id"], name: "index_addresses_on_member_id"
  end

  create_table "attendees", force: :cascade do |t|
    t.text     "form_reply"
    t.boolean  "paid"
    t.integer  "member_id"
    t.integer  "event_instance_id"
    t.boolean  "canceled"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["event_instance_id"], name: "index_attendees_on_event_instance_id"
    t.index ["member_id"], name: "index_attendees_on_member_id"
  end

  create_table "event_instances", force: :cascade do |t|
    t.text     "form"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "address_id"
    t.text     "details"
    t.decimal  "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_event_instances_on_address_id"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "families", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.date     "birthday"
    t.string   "email"
    t.string   "phone1"
    t.string   "phone2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "family_id"
    t.integer  "address_id"
    t.index ["address_id"], name: "index_members_on_address_id"
    t.index ["family_id"], name: "index_members_on_family_id"
  end

  create_table "members_members", id: false, force: :cascade do |t|
    t.integer "member_id", null: false
  end

end
