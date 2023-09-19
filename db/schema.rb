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

ActiveRecord::Schema.define(version: 2023_09_19_032253) do

  create_table "movie_theaters", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "province"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.string "director"
    t.text "actors"
    t.text "description"
    t.string "country"
    t.string "genre"
    t.date "releaseDate"
    t.integer "movie_theater_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_theater_id"], name: "index_movies_on_movie_theater_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "seat"
    t.string "room"
    t.decimal "price", precision: 10, scale: 2
    t.datetime "showtime"
    t.string "status"
    t.integer "movie_id"
    t.integer "movie_theater_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_tickets_on_movie_id"
    t.index ["movie_theater_id"], name: "index_tickets_on_movie_theater_id"
  end

  create_table "user_tickets", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_user_tickets_on_ticket_id"
    t.index ["user_id"], name: "index_user_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "role"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
