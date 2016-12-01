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

ActiveRecord::Schema.define(version: 20161130064006) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ad_requests", force: :cascade do |t|
    t.string   "first_name",     limit: 25
    t.string   "last_name",      limit: 50
    t.string   "phone_num",      limit: 12
    t.string   "email",                     default: "", null: false
    t.text     "request_detail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ad_name",        limit: 25
  end

  create_table "ar_internal_metadata", primary_key: "key", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dietlabels", force: :cascade do |t|
    t.string   "name"
    t.string   "apiparameter"
    t.string   "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "dietlabels_preferences", force: :cascade do |t|
    t.integer "preference_id"
    t.integer "dietlabel_id"
  end

  add_index "dietlabels_preferences", ["dietlabel_id"], name: "index_dietlabels_preferences_on_dietlabel_id", using: :btree
  add_index "dietlabels_preferences", ["preference_id"], name: "index_dietlabels_preferences_on_preference_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "time"
    t.string   "activity_type"
    t.string   "location"
    t.string   "group_owner"
    t.string   "member1"
    t.string   "member2"
    t.string   "member3"
    t.string   "member4"
    t.string   "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "member1id"
    t.integer  "member2id"
    t.integer  "member3id"
    t.integer  "member4id"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "healthlabels", force: :cascade do |t|
    t.string   "name"
    t.string   "apiparameter"
    t.string   "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "healthlabels_preferences", force: :cascade do |t|
    t.integer "preference_id"
    t.integer "healthlabel_id"
  end

  add_index "healthlabels_preferences", ["healthlabel_id"], name: "index_healthlabels_preferences_on_healthlabel_id", using: :btree
  add_index "healthlabels_preferences", ["preference_id"], name: "index_healthlabels_preferences_on_preference_id", using: :btree

  create_table "ingredient_lines", force: :cascade do |t|
    t.text     "text"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.text     "text"
    t.string   "quantity"
    t.string   "measure"
    t.string   "food"
    t.string   "weight"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "message_boards", force: :cascade do |t|
    t.string   "sender"
    t.string   "group_name"
    t.string   "message"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.string   "recipe_id"
    t.string   "recipe_name"
    t.string   "health_labels"
    t.string   "diet_labels"
    t.string   "image_url"
    t.string   "share_as"
    t.text     "dietLabels"
    t.text     "healthLabels"
    t.text     "cautions"
    t.string   "source"
    t.string   "sourceIcon"
    t.string   "yield"
    t.string   "calories"
    t.string   "totalWeight"
  end

  create_table "recipes_savedrecipes", force: :cascade do |t|
    t.integer "savedrecipe_id"
    t.integer "recipe_id"
  end

  add_index "recipes_savedrecipes", ["recipe_id"], name: "index_recipes_savedrecipes_on_recipe_id", using: :btree
  add_index "recipes_savedrecipes", ["savedrecipe_id"], name: "index_recipes_savedrecipes_on_savedrecipe_id", using: :btree

  create_table "savedrecipes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "total_daily_nodes", force: :cascade do |t|
    t.string   "label"
    t.string   "quantity"
    t.string   "unit"
    t.string   "node_label"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "total_nutrient_nodes", force: :cascade do |t|
    t.string   "label"
    t.string   "quantity"
    t.string   "unit"
    t.string   "node_label"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "gender"
    t.string   "major"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
  end

  create_table "widgets", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
