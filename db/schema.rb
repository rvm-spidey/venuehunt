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

# ActiveRecord::Schema[7.0].define(version: 2023_09_18_183722) do
#   # These are extensions that must be enabled in order to support this database
#   enable_extension "plpgsql"

#   create_table "active_storage_attachments", force: :cascade do |t|
#     t.string "name", null: false
#     t.string "record_type", null: false
#     t.bigint "record_id", null: false
#     t.bigint "blob_id", null: false
#     t.datetime "created_at", null: false
#     t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
#     t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
#   end

#   create_table "active_storage_blobs", force: :cascade do |t|
#     t.string "key", null: false
#     t.string "filename", null: false
#     t.string "content_type"
#     t.text "metadata"
#     t.string "service_name", null: false
#     t.bigint "byte_size", null: false
#     t.string "checksum"
#     t.datetime "created_at", null: false
#     t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
#   end

#   create_table "active_storage_variant_records", force: :cascade do |t|
#     t.bigint "blob_id", null: false
#     t.string "variation_digest", null: false
#     t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
#   end

#   create_table "bookings", force: :cascade do |t|
#     t.date "date_from"
#     t.date "date_to"
#     t.string "event_name"
#     t.integer "number_of_participants"
#     t.string "food"
#     t.string "beverage"
#     t.string "other_services_offered"
#     t.integer "total"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.bigint "venue_id"
#     t.bigint "cart_id"
#     t.index ["cart_id"], name: "index_bookings_on_cart_id"
#     t.index ["venue_id"], name: "index_bookings_on_venue_id"
#   end

#   create_table "carts", force: :cascade do |t|
#     t.integer "total"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.bigint "user_id"
#     t.index ["user_id"], name: "index_carts_on_user_id"
#   end

#   create_table "locations", force: :cascade do |t|
#     t.string "name"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.text "outline"
#     t.text "description"
#     t.string "address"
#     t.float "latitude"
#     t.float "longitude"
#   end

#   create_table "orders", force: :cascade do |t|
#     t.string "email_address"
#     t.integer "card_number"
#     t.date "exp_date"
#     t.integer "cvc"
#     t.integer "total"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.bigint "user_id"
#     t.bigint "cart_id"
#     t.string "phone_number"
#     t.string "order_confirmation_email"
#     t.index ["cart_id"], name: "index_orders_on_cart_id"
#     t.index ["user_id"], name: "index_orders_on_user_id"
#   end

#   create_table "reviews", force: :cascade do |t|
#     t.integer "rating"
#     t.string "content"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.bigint "venue_id"
#     t.bigint "booking_id"
#     t.index ["booking_id"], name: "index_reviews_on_booking_id"
#     t.index ["venue_id"], name: "index_reviews_on_venue_id"
#   end

#   create_table "users", force: :cascade do |t|
#     t.string "email", default: "", null: false
#     t.string "encrypted_password", default: "", null: false
#     t.string "reset_password_token"
#     t.datetime "reset_password_sent_at"
#     t.datetime "remember_created_at"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.string "first_name"
#     t.string "last_name"
#     t.boolean "admin"
#     t.string "company_name"
#     t.string "company_address"
#     t.float "latitude"
#     t.float "longitude"
#     t.index ["email"], name: "index_users_on_email", unique: true
#     t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
#   end

#   create_table "venues", force: :cascade do |t|
#     t.string "name"
#     t.text "description"
#     t.integer "space_size"
#     t.time "opening_time"
#     t.time "closing_time"
#     t.boolean "availability"
#     t.string "address"
#     t.float "latitude"
#     t.float "longitude"
#     t.integer "price"
#     t.boolean "food_beverages_offered"
#     t.boolean "other_services_offered"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.bigint "location_id"
#     t.bigint "users_id"
#     t.bigint "venuetype_id"
#     t.index ["location_id"], name: "index_venues_on_location_id"
#     t.index ["users_id"], name: "index_venues_on_users_id"
#     t.index ["venuetype_id"], name: "index_venues_on_venuetype_id"
#   end

#   create_table "venuetypes", force: :cascade do |t|
#     t.string "name"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end

#   add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
#   add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
#   add_foreign_key "bookings", "carts"
#   add_foreign_key "bookings", "venues"
#   add_foreign_key "carts", "users"
#   add_foreign_key "orders", "carts"
#   add_foreign_key "orders", "users"
#   add_foreign_key "reviews", "bookings"
#   add_foreign_key "reviews", "venues"
#   add_foreign_key "venues", "locations"
#   add_foreign_key "venues", "users", column: "users_id"
#   add_foreign_key "venues", "venuetypes"
# end

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
ActiveRecord::Schema[7.0].define(version: 2023_09_18_183722) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end
  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end
  create_table "bookings", force: :cascade do |t|
    t.date "date_from"
    t.date "date_to"
    t.string "event_name"
    t.integer "number_of_participants"
    t.string "food"
    t.string "beverage"
    t.string "other_services_offered"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "venue_id"
    t.bigint "cart_id"
    t.string "status"
    t.index ["cart_id"], name: "index_bookings_on_cart_id"
    t.index ["venue_id"], name: "index_bookings_on_venue_id"
  end
  create_table "carts", force: :cascade do |t|
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end
  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "admin_id"
    t.index ["admin_id"], name: "index_chatrooms_on_admin_id"
  end
  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "outline"
    t.text "description"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
  end
  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end
  create_table "orders", force: :cascade do |t|
    t.string "email_address"
    t.integer "card_number"
    t.date "exp_date"
    t.integer "cvc"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "cart_id"
    t.string "phone_number"
    t.string "order_confirmation_email"
    t.index ["cart_id"], name: "index_orders_on_cart_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end
  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "venue_id"
    t.bigint "booking_id"
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
    t.index ["venue_id"], name: "index_reviews_on_venue_id"
  end
  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin"
    t.string "company_name"
    t.string "company_address"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end
  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "space_size"
    t.time "opening_time"
    t.time "closing_time"
    t.boolean "availability"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.integer "price"
    t.boolean "food_beverages_offered"
    t.boolean "other_services_offered"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_id"
    t.bigint "user_id"
    t.bigint "venuetype_id"
    t.index ["location_id"], name: "index_venues_on_location_id"
    t.index ["user_id"], name: "index_venues_on_user_id"
    t.index ["venuetype_id"], name: "index_venues_on_venuetype_id"
  end
  create_table "venuetypes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "carts"
  add_foreign_key "bookings", "venues"
  add_foreign_key "carts", "users"
  add_foreign_key "chatrooms", "users", column: "admin_id"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "orders", "carts"
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "reviews", "venues"
  add_foreign_key "venues", "locations"
  add_foreign_key "venues", "users"
  add_foreign_key "venues", "venuetypes"
end
