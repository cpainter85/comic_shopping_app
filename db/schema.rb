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

ActiveRecord::Schema.define(version: 20150502184353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "fuzzystrmatch"
  enable_extension "pg_trgm"

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

  create_table "for_sale_bundles", force: :cascade do |t|
    t.integer  "volume_id"
    t.integer  "vendor_id"
    t.string   "url"
    t.integer  "price_in_cents"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "for_sale_comics", force: :cascade do |t|
    t.integer  "issue_id"
    t.integer  "vendor_id"
    t.string   "url"
    t.integer  "price_in_cents"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vendor_issue_id"
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

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
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

  create_table "vendor_data", force: :cascade do |t|
    t.string   "title"
    t.integer  "price_in_cents"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendors", force: :cascade do |t|
    t.string   "name"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
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
