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

ActiveRecord::Schema.define(version: 2018_10_01_094046) do

  create_table "answer_question_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "tag_id"
    t.string "tagable_type"
    t.bigint "tagable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_answer_question_tags_on_tag_id"
    t.index ["tagable_type", "tagable_id"], name: "index_answer_question_tags_on_tagable_type_and_tagable_id"
  end

  create_table "answers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "answer", null: false
    t.integer "status", default: 1
    t.integer "vote_count", default: 0
    t.bigint "question_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "comment", null: false
    t.bigint "user_id"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "questions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "question", null: false
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vote_count"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "questions_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "tag_id"
    t.index ["question_id"], name: "index_questions_tags_on_question_id"
    t.index ["tag_id"], name: "index_questions_tags_on_tag_id"
  end

  create_table "sessions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "authentication_token"
    t.integer "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["authentication_token"], name: "index_sessions_on_authentication_token", unique: true
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "tag_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_name"], name: "index_tags_on_tag_name", unique: true
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "phone_number", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["phone_number"], name: "index_users_on_phone_number"
  end

  create_table "votes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "vote_type"
    t.string "voteable_type"
    t.bigint "voteable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "voteable_id", "voteable_type"], name: "index_votes_on_user_id_and_voteable_id_and_voteable_type", unique: true
    t.index ["user_id"], name: "index_votes_on_user_id"
    t.index ["voteable_type", "voteable_id"], name: "index_votes_on_voteable_type_and_voteable_id"
  end

  add_foreign_key "answer_question_tags", "tags"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "questions", "users"
  add_foreign_key "questions_tags", "questions"
  add_foreign_key "questions_tags", "tags"
  add_foreign_key "sessions", "users"
  add_foreign_key "votes", "users"
end
