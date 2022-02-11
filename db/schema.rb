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

ActiveRecord::Schema.define(version: 2022_02_10_192043) do

  create_table "addresses", force: :cascade do |t|
    t.integer "npi_record_id"
    t.string "country_code"
    t.string "country_name"
    t.string "address_purpose"
    t.string "address_type"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "telephone_number"
    t.string "fax_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["npi_record_id"], name: "index_addresses_on_npi_record_id"
  end

  create_table "identifiers", force: :cascade do |t|
    t.integer "npi_record_id"
    t.string "identifier"
    t.string "code"
    t.string "desc"
    t.string "state"
    t.string "issuer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["npi_record_id"], name: "index_identifiers_on_npi_record_id"
  end

  create_table "npi_records", force: :cascade do |t|
    t.integer "identifier"
    t.string "enumeration_type"
    t.integer "npi"
    t.integer "last_updated_epoch"
    t.integer "created_epoch"
    t.string "first_name"
    t.string "last_name"
    t.string "credential"
    t.boolean "sole_proprietor"
    t.string "gender"
    t.string "enumeration_date"
    t.string "last_updated"
    t.string "status"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxonomies", force: :cascade do |t|
    t.integer "npi_record_id"
    t.string "code"
    t.string "desc"
    t.boolean "primary"
    t.string "state"
    t.string "license"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["npi_record_id"], name: "index_taxonomies_on_npi_record_id"
  end

end
