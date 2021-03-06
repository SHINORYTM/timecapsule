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

ActiveRecord::Schema.define(version: 2018_09_04_064720) do

  create_table "albums", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "send_time"
    t.string "target_for"
    t.string "title"
    t.string "status"
    t.integer "favorite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "message"
  end

  create_table "details", force: :cascade do |t|
    t.integer "page"
    t.integer "layout"
    t.integer "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "img_date"
  end

  create_table "images", force: :cascade do |t|
    t.string "image"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string "image_name"
    t.integer "user_id"
    t.string "title"
    t.text "coment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sent_email"
    t.datetime "send_time"
    t.string "status", default: "none"
    t.integer "favarite"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
  end

end
