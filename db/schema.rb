# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_07_234951) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.text "name_ciphertext"
    t.text "lat_ciphertext"
    t.text "lng_ciphertext"
    t.text "address_line_1_ciphertext"
    t.text "address_line_2_ciphertext"
    t.text "city_id_ciphertext"
    t.string "addressable_type", null: false
    t.bigint "addressable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
    t.index ["city_id_ciphertext"], name: "index_addresses_on_city_id_ciphertext"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "state_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "phone_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "organization_members", force: :cascade do |t|
    t.string "member_type", null: false
    t.bigint "member_id", null: false
    t.bigint "organization_id", null: false
    t.integer "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_type", "member_id"], name: "index_organization_members_on_member_type_and_member_id"
    t.index ["organization_id"], name: "index_organization_members_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.text "about"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "owner_type", null: false
    t.bigint "owner_id", null: false
    t.index ["owner_type", "owner_id"], name: "index_organizations_on_owner_type_and_owner_id"
  end

  create_table "parcels", force: :cascade do |t|
    t.bigint "service_request_id", null: false
    t.decimal "weight_value", precision: 10, scale: 2, default: "0.0"
    t.string "weight_unit", limit: 12, default: "kg"
    t.decimal "length_value", precision: 10, scale: 2, default: "0.0"
    t.string "length_unit", limit: 12, default: "cm"
    t.decimal "width_value", precision: 10, scale: 2, default: "0.0"
    t.string "width_unit", limit: 12, default: "cm"
    t.decimal "height_value", precision: 10, scale: 2, default: "0.0"
    t.string "height_unit", limit: 12, default: "cm"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "barcode"
    t.string "description"
    t.index ["service_request_id"], name: "index_parcels_on_service_request_id"
  end

  create_table "personal_profiles", force: :cascade do |t|
    t.text "first_name_ciphertext"
    t.text "last_name_ciphertext"
    t.text "mobile_number_ciphertext"
    t.text "mobile_country_id_ciphertext"
    t.text "nationality_id_ciphertext"
    t.text "vat_number_ciphertext"
    t.text "id_number_ciphertext"
    t.text "birthday_ciphertext"
    t.string "owner_type", null: false
    t.bigint "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_type", "owner_id"], name: "index_personal_profiles_on_owner_type_and_owner_id"
  end

  create_table "recipient_addresses", force: :cascade do |t|
    t.bigint "recipient_id", null: false
    t.boolean "default", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipient_id"], name: "index_recipient_addresses_on_recipient_id"
  end

  create_table "recipients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "mobile_phone_country_id"
    t.string "mobile_number"
    t.integer "home_address_id"
    t.integer "work_address_id"
    t.integer "nationality_country_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mobile_phone_country_id"], name: "index_recipients_on_mobile_phone_country_id"
    t.index ["nationality_country_id"], name: "index_recipients_on_nationality_country_id"
  end

  create_table "service_requests", force: :cascade do |t|
    t.bigint "recipient_id", null: false
    t.bigint "organization_id", null: false
    t.text "description"
    t.text "notes"
    t.integer "pickup_address_id"
    t.string "delivery_address_id"
    t.string "pickup_tracking_link"
    t.datetime "pickup_after"
    t.datetime "pickup_before"
    t.time "picked_up_at"
    t.datetime "deliver_after"
    t.datetime "deliver_before"
    t.string "delivery_tracking_link"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_service_requests_on_organization_id"
    t.index ["recipient_id"], name: "index_service_requests_on_recipient_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "encrypted_password", default: "", null: false
    t.text "email_ciphertext"
    t.string "email_bidx"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.text "settings_ciphertext"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin"
    t.index ["email_bidx"], name: "index_users_on_email_bidx", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "warehouses", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "address_id", null: false
    t.boolean "default", default: false, null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_warehouses_on_address_id"
    t.index ["organization_id"], name: "index_warehouses_on_organization_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cities", "states"
  add_foreign_key "organization_members", "organizations"
  add_foreign_key "parcels", "service_requests"
  add_foreign_key "recipient_addresses", "recipients"
  add_foreign_key "service_requests", "organizations"
  add_foreign_key "service_requests", "recipients"
  add_foreign_key "states", "countries"
  add_foreign_key "warehouses", "addresses"
  add_foreign_key "warehouses", "organizations"
end
