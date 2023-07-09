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

ActiveRecord::Schema[7.0].define(version: 2023_06_14_215322) do
  create_table "buy_demands", force: :cascade do |t|
    t.integer "buyer_id", null: false
    t.integer "seller_id", null: false
    t.integer "pokemon_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_buy_demands_on_buyer_id"
    t.index ["pokemon_id"], name: "index_buy_demands_on_pokemon_id"
    t.index ["seller_id"], name: "index_buy_demands_on_seller_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.string "image_path"
    t.integer "weight"
    t.integer "height"
    t.float "price", default: 0.0
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "on_sale", default: false
    t.index ["user_id"], name: "index_pokemons_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "action"
    t.integer "user_id", null: false
    t.integer "pokemon_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pokemon_id"], name: "index_transactions_on_pokemon_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "balance", default: 0.0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "buy_demands", "pokemons"
  add_foreign_key "buy_demands", "users", column: "buyer_id"
  add_foreign_key "buy_demands", "users", column: "seller_id"
  add_foreign_key "pokemons", "users"
  add_foreign_key "transactions", "pokemons"
  add_foreign_key "transactions", "users"
end
