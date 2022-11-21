# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_12_070002) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: :cascade do |t|
    t.string "key"
    t.bigint "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_api_keys_on_employee_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "aasm_state"
    t.datetime "booking_at", null: false
    t.string "email_address", null: false
    t.string "address", null: false
    t.float "lat"
    t.float "lng"
    t.string "notes"
    t.bigint "client_id"
    t.bigint "created_by_id", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_bookings_on_client_id"
    t.index ["discarded_at"], name: "index_bookings_on_discarded_at"
  end

  create_table "bookings_employees", id: false, force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.bigint "employee_id", null: false
    t.index ["booking_id", "employee_id"], name: "index_bookings_employees_on_booking_id_and_employee_id"
    t.index ["employee_id", "booking_id"], name: "index_bookings_employees_on_employee_id_and_booking_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "firstname"
    t.string "surname"
    t.date "date_of_birth"
    t.string "notes"
    t.string "address", null: false
    t.string "email_address"
    t.string "phone_number"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_clients_on_discarded_at"
  end

  create_table "employees", force: :cascade do |t|
    t.string "kind"
    t.string "firstname"
    t.string "surname"
    t.string "email_address"
    t.string "address"
    t.string "phone_number"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_employees_on_discarded_at"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "code"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "surname"
    t.string "email_address"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "name"
    t.string "registration"
    t.bigint "employee_id", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_vehicles_on_discarded_at"
    t.index ["employee_id"], name: "index_vehicles_on_employee_id"
  end

  add_foreign_key "api_keys", "employees"
  add_foreign_key "bookings", "clients"
  add_foreign_key "sessions", "users"
  add_foreign_key "vehicles", "employees"
end
