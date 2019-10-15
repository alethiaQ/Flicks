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

ActiveRecord::Schema.define(version: 2019_10_12_231932) do

  create_table "genres", force: :cascade do |t|
    t.string "name"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "preview"
    t.string "actors"
    t.string "director"
    t.string "release_date"
  end

  create_table "movies_genres", force: :cascade do |t|
    t.integer "movie_id", null: false
    t.integer "genre_id", null: false
    t.index ["genre_id"], name: "index_movies_genres_on_genre_id"
    t.index ["movie_id"], name: "index_movies_genres_on_movie_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "genres"
    t.integer "role"
    t.string "image"
    t.string "uid"
  end

  add_foreign_key "movies_genres", "genres"
  add_foreign_key "movies_genres", "movies"
end
