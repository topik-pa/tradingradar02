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

ActiveRecord::Schema.define(version: 2019_02_02_154951) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "analyses", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "body"
    t.string "stock"
    t.string "reuters"
    t.string "isin"
    t.string "author"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "market"
    t.index ["slug"], name: "index_analyses_on_slug", unique: true
  end

  create_table "cac40_reports", force: :cascade do |t|
    t.string "isin", null: false
    t.string "stock"
    t.string "tradingsat_trendshort"
    t.string "tradingsat_trendmedium"
    t.string "tradingsat_trendlong"
    t.decimal "boursefortuneo_support", precision: 8, scale: 4
    t.decimal "boursefortuneo_resistance", precision: 8, scale: 4
    t.decimal "boursefortuneo_volatility"
    t.decimal "boursefortuneo_target", precision: 8, scale: 4
    t.string "boursefortuneo_rating"
    t.string "boursefortuneo_trendshort"
    t.string "boursefortuneo_trendmedium"
    t.string "zonebourse_trendshort"
    t.string "zonebourse_trendmedium"
    t.string "zonebourse_trendlong"
    t.decimal "zonebourse_resistance", precision: 8, scale: 4
    t.decimal "zonebourse_support", precision: 8, scale: 4
    t.string "abcbourse_consensus"
    t.string "abcbourse_tendency"
    t.string "lefigaro_consensus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dax30_reports", force: :cascade do |t|
    t.string "isin", null: false
    t.string "stock"
    t.decimal "finanzen_rating"
    t.decimal "finanzen_ratingmoodys"
    t.decimal "finanzen_sentiment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fias_reports", force: :cascade do |t|
    t.string "isin", null: false
    t.string "stock"
    t.decimal "borsaitaliana_support", precision: 8, scale: 4
    t.decimal "borsaitaliana_resistance", precision: 8, scale: 4
    t.integer "borsaitaliana_fta"
    t.decimal "borsaitaliana_rsi"
    t.decimal "borsaitaliana_volatility"
    t.string "sole24ore_shorttrend"
    t.string "sole24ore_mediumtrend"
    t.string "sole24ore_rating"
    t.integer "sole24ore_relativestrenght"
    t.decimal "sole24ore_support", precision: 8, scale: 4
    t.decimal "sole24ore_resistance", precision: 8, scale: 4
    t.integer "sole24ore_fta"
    t.integer "sole24ore_rsi"
    t.string "sole24ore_rsidiv"
    t.text "sole24ore_strategy"
    t.decimal "milanofinanza_risk"
    t.string "milanofinanza_rating"
    t.string "milanofinanza_trendshort"
    t.string "milanofinanza_trendmedium"
    t.string "milanofinanza_trendlong"
    t.decimal "teleborsa_support", precision: 8, scale: 4
    t.decimal "teleborsa_resistance", precision: 8, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follow_stock_newsletters", force: :cascade do |t|
    t.string "stock"
    t.string "isin"
    t.string "email"
    t.boolean "active"
    t.boolean "privacy"
    t.string "referrer"
    t.integer "sended", default: 0
    t.integer "total_sended", default: 0
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "followers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.text "image"
    t.index ["email"], name: "index_followers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_followers_on_reset_password_token", unique: true
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "market_suggestions_newsletters", force: :cascade do |t|
    t.string "email"
    t.boolean "active"
    t.boolean "privacy"
    t.string "referrer"
    t.integer "sended", default: 0
    t.integer "total_sended", default: 0
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "markets", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "value", precision: 8, scale: 4
    t.decimal "variation", precision: 8, scale: 4
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "source_frances", force: :cascade do |t|
    t.string "isin"
    t.string "name"
    t.string "url_0"
    t.string "url_1"
    t.string "url_2"
    t.string "url_3"
    t.string "url_4"
    t.string "url_5"
    t.string "url_6"
    t.string "url_7"
    t.string "url_8"
    t.string "url_9"
    t.string "url_10"
    t.string "url_11"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "source_italies", force: :cascade do |t|
    t.string "isin"
    t.string "name"
    t.string "url_0"
    t.string "url_1"
    t.string "url_2"
    t.string "url_3"
    t.string "url_4"
    t.string "url_5"
    t.string "url_6"
    t.string "url_7"
    t.string "url_8"
    t.string "url_9"
    t.string "url_10"
    t.string "url_11"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.string "isin", null: false
    t.string "reuters"
    t.string "name"
    t.string "sector"
    t.decimal "last_price", precision: 8, scale: 4
    t.decimal "variation"
    t.string "market_phase"
    t.string "corporate_url"
    t.string "address"
    t.string "phone"
    t.string "market"
    t.string "currency"
    t.text "profile"
    t.string "keywords"
    t.decimal "dividend", precision: 8, scale: 4
    t.string "dividend_date"
    t.decimal "dividend_yeld"
    t.decimal "performance1"
    t.decimal "performance6"
    t.decimal "performance12"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_reports", force: :cascade do |t|
    t.string "isin", null: false
    t.string "stock"
    t.decimal "support", precision: 8, scale: 4
    t.decimal "resistance", precision: 8, scale: 4
    t.string "trendshort"
    t.string "trendmedium"
    t.string "trendlong"
    t.integer "rating"
    t.text "note"
    t.decimal "buy", precision: 8, scale: 4
    t.decimal "sell", precision: 8, scale: 4
    t.decimal "sl", precision: 8, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
