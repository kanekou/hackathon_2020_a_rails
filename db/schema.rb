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

ActiveRecord::Schema.define(version: 2020_08_29_033240) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adresses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "adress"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_adresses_on_user_id"
  end

  create_table "articles", force: :cascade do |t|
    t.bigint "topic_id", null: false
    t.string "title"
    t.string "summary"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["topic_id"], name: "index_articles_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.datetime "default_delivery_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_article_insights", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "article_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_user_article_insights_on_article_id"
    t.index ["user_id"], name: "index_user_article_insights_on_user_id"
  end

  create_table "user_recommended_news_histories", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_recommended_news_histories_on_user_id"
  end

  create_table "user_recommended_news_history_articles", force: :cascade do |t|
    t.bigint "user_recommended_news_history_id", null: false
    t.bigint "article_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_user_recommended_news_history_articles_on_article_id"
    t.index ["user_recommended_news_history_id"], name: "user_recommended_news_history_id"
  end

  create_table "user_topic_insigthts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "topic_id", null: false
    t.integer "views"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["topic_id"], name: "index_user_topic_insigthts_on_topic_id"
    t.index ["user_id"], name: "index_user_topic_insigthts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "nickname"
    t.string "password_digest"
    t.datetime "everyday_news_delivery_time"
    t.datetime "heat_stroke_news_delivery_time"
    t.string "api_key"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "adresses", "users"
  add_foreign_key "articles", "topics"
  add_foreign_key "user_article_insights", "articles"
  add_foreign_key "user_article_insights", "users"
  add_foreign_key "user_recommended_news_histories", "users"
  add_foreign_key "user_recommended_news_history_articles", "articles"
  add_foreign_key "user_recommended_news_history_articles", "user_recommended_news_histories"
  add_foreign_key "user_topic_insigthts", "topics"
  add_foreign_key "user_topic_insigthts", "users"
end
