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

ActiveRecord::Schema.define(version: 20150414050902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "creators", force: :cascade do |t|
    t.string   "name"
    t.integer  "comic_vine_creator_id"
    t.text     "short_description"
    t.text     "full_description"
    t.string   "profile_picture_url"
    t.string   "profile_picture_thumb_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issue_credits", force: :cascade do |t|
    t.integer  "creator_id"
    t.integer  "issue_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issues", force: :cascade do |t|
    t.string   "issue_number"
    t.integer  "comic_vine_issue_id"
    t.text     "description"
    t.string   "cover_image_url"
    t.string   "thumbnail_url"
    t.string   "story_name"
    t.integer  "volume_id"
    t.date     "cover_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publishers", force: :cascade do |t|
    t.string   "name"
    t.integer  "comic_vine_pub_id"
    t.string   "website"
    t.string   "short_description"
    t.text     "full_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_url"
    t.string   "logo_thumb_url"
  end

  create_table "volumes", force: :cascade do |t|
    t.string   "name"
    t.integer  "comic_vine_vol_id"
    t.text     "description"
    t.string   "image_url"
    t.string   "thumbnail_url"
    t.integer  "start_year"
    t.integer  "publisher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
