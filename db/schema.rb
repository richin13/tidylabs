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

ActiveRecord::Schema.define(version: 20170614171019) do

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "asset_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "accepts_warranty_details",  default: false
    t.boolean  "accepts_technical_details", default: false
    t.boolean  "accepts_security_details",  default: false
    t.boolean  "accepts_network_details",   default: false
  end

  create_table "asset_revisions", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "asset_id"
    t.integer  "revision_id"
  end

  create_table "assets", force: :cascade do |t|
    t.integer  "serial_number",        limit: 8
    t.text     "description"
    t.integer  "plate_number"
    t.integer  "quantity"
    t.integer  "status"
    t.string   "type"
    t.integer  "area_id"
    t.integer  "asset_category_id"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "has_warranty",                   default: false
    t.boolean  "has_tech_details",               default: false
    t.boolean  "has_security_details",           default: false
    t.boolean  "has_network_details",            default: false
    t.index ["area_id"], name: "index_assets_on_area_id"
    t.index ["asset_category_id"], name: "index_assets_on_asset_category_id"
  end

  create_table "assets_revisions", id: false, force: :cascade do |t|
    t.integer "asset_id",    null: false
    t.integer "revision_id", null: false
    t.index ["asset_id", "revision_id"], name: "index_assets_revisions_on_asset_id_and_revision_id"
    t.index ["revision_id", "asset_id"], name: "index_assets_revisions_on_revision_id_and_asset_id"
  end

  create_table "identification_codes", force: :cascade do |t|
    t.string   "code"
    t.string   "code_type"
    t.integer  "asset_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["asset_id"], name: "index_identification_codes_on_asset_id"
  end

  create_table "loans", force: :cascade do |t|
    t.string   "applicant_name"
    t.string   "applicant_dni"
    t.string   "phone_number"
    t.date     "return_date"
    t.string   "observations"
    t.integer  "asset_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "finished",       default: false
    t.index ["asset_id"], name: "index_loans_on_asset_id"
  end

  create_table "network_details", force: :cascade do |t|
    t.string   "ip"
    t.string   "mask"
    t.string   "gateway"
    t.string   "dns"
    t.integer  "asset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_network_details_on_asset_id"
  end

  create_table "relocations", force: :cascade do |t|
    t.text     "reason"
    t.integer  "asset_id"
    t.integer  "from_area_id"
    t.integer  "to_area_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["asset_id"], name: "index_relocations_on_asset_id"
  end

  create_table "revisions", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "name"
    t.text     "description"
    t.boolean  "open",        default: true
  end

  create_table "security_details", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.integer  "asset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_security_details_on_asset_id"
  end

  create_table "support_tickets", force: :cascade do |t|
    t.string   "description"
    t.integer  "status"
    t.integer  "asset_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["asset_id"], name: "index_support_tickets_on_asset_id"
  end

  create_table "technical_details", force: :cascade do |t|
    t.string   "cpu"
    t.integer  "ram"
    t.integer  "hdd"
    t.string   "os"
    t.string   "other"
    t.integer  "asset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_technical_details_on_asset_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "",   null: false
    t.string   "encrypted_password",                default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "pin"
    t.string   "name"
    t.string   "lastname"
    t.boolean  "can_login",                         default: true
    t.string   "authentication_token",   limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "warranties", force: :cascade do |t|
    t.date     "purchase_date"
    t.integer  "month_period"
    t.string   "agent_name"
    t.string   "agent_phone"
    t.integer  "asset_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["asset_id"], name: "index_warranties_on_asset_id"
  end

end
