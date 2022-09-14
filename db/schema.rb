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

ActiveRecord::Schema[7.0].define(version: 2022_09_12_061946) do
  create_table "assessable_areas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "shop_id"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_assessable_areas_on_city_id"
    t.index ["shop_id"], name: "index_assessable_areas_on_shop_id"
  end

  create_table "cities", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "prefecture_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture_id"], name: "index_cities_on_prefecture_id"
  end

  create_table "companies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "ieul_company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefectures", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "shop_id"
    t.bigint "city_id"
    t.string "remaining_address", null: false
    t.integer "type_of_property", null: false
    t.integer "times_of_sales", null: false
    t.date "sale_consideration_date", null: false
    t.date "assessment_request_date", null: false
    t.date "sale_date", null: false
    t.date "sold_out_date", null: false
    t.date "delivery_date", null: false
    t.integer "gender", null: false
    t.integer "age", null: false
    t.integer "assessment_price", null: false
    t.integer "sale_price", null: false
    t.integer "required_months_after_discount"
    t.integer "discount_price"
    t.integer "contract_price", null: false
    t.integer "contract_category", null: false
    t.string "title", null: false
    t.integer "reason_for_sales", null: false
    t.text "concern_at_sales", null: false
    t.text "reason_for_selection", null: false
    t.integer "response_satisfaction", null: false
    t.text "reason_for_response_satisfaction", null: false
    t.text "advice", null: false
    t.text "improvement_point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_reviews_on_city_id"
    t.index ["shop_id"], name: "index_reviews_on_shop_id"
  end

  create_table "shops", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "city_id"
    t.bigint "ieul_shop_id", null: false
    t.string "postal_code"
    t.string "name", null: false
    t.text "catch_copy", null: false
    t.string "remaining_address", null: false
    t.string "telephone_number"
    t.string "fax_number"
    t.string "opening_hour"
    t.string "holiday"
    t.text "introduction", null: false
    t.text "logo_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_shops_on_city_id"
    t.index ["company_id"], name: "index_shops_on_company_id"
  end

  add_foreign_key "assessable_areas", "cities"
  add_foreign_key "assessable_areas", "shops"
  add_foreign_key "cities", "prefectures"
  add_foreign_key "reviews", "cities"
  add_foreign_key "reviews", "shops"
  add_foreign_key "shops", "cities"
  add_foreign_key "shops", "companies"
end
