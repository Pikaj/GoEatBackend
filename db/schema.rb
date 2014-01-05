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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140102183110) do

  create_table "adres", force: true do |t|
    t.string   "street"
    t.string   "number"
    t.string   "postal_code"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "adres", ["location_id"], name: "index_adres_on_location_id"

  create_table "cities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["restaurant_id"], name: "index_comments_on_restaurant_id"

  create_table "dish_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dishes", force: true do |t|
    t.string   "name"
    t.float    "price"
    t.integer  "Menu_id"
    t.integer  "sale_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dishes", ["Menu_id"], name: "index_dishes_on_Menu_id"
  add_index "dishes", ["sale_id"], name: "index_dishes_on_sale_id"

  create_table "element_dish_categories", force: true do |t|
    t.integer  "dish_id"
    t.integer  "DishCategory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "element_dish_categories", ["DishCategory_id"], name: "index_element_dish_categories_on_DishCategory_id"
  add_index "element_dish_categories", ["dish_id"], name: "index_element_dish_categories_on_dish_id"

  create_table "element_restaurant_categories", force: true do |t|
    t.integer  "restaurant_id"
    t.integer  "RestaurantCategory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "element_restaurant_categories", ["RestaurantCategory_id"], name: "index_element_restaurant_categories_on_RestaurantCategory_id"
  add_index "element_restaurant_categories", ["restaurant_id"], name: "index_element_restaurant_categories_on_restaurant_id"

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.integer  "dish_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingredients", ["dish_id"], name: "index_ingredients_on_dish_id"

  create_table "locations", force: true do |t|
    t.string   "coordinates"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["restaurant_id"], name: "index_locations_on_restaurant_id"

  create_table "menus", force: true do |t|
    t.text     "description"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menus", ["restaurant_id"], name: "index_menus_on_restaurant_id"

  create_table "owners", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "owners", ["email"], name: "index_owners_on_email", unique: true
  add_index "owners", ["reset_password_token"], name: "index_owners_on_reset_password_token", unique: true

  create_table "restaurant_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "owner"
    t.text     "description"
    t.float    "rating"
    t.integer  "number_raings"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "restaurants", ["city_id"], name: "index_restaurants_on_city_id"

  create_table "sales", force: true do |t|
    t.string   "date_from"
    t.string   "date_to"
    t.text     "description"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sales", ["restaurant_id"], name: "index_sales_on_restaurant_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
