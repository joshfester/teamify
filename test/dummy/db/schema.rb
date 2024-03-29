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

ActiveRecord::Schema[7.1].define(version: 2024_01_31_234040) do
  create_table "invitations", force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "from_membership_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_membership_id"], name: "index_invitations_on_from_membership_id"
    t.index ["team_id"], name: "index_invitations_on_team_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.string "member_type", null: false
    t.integer "member_id", null: false
    t.integer "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_type", "member_id"], name: "index_memberships_on_member"
    t.index ["team_id"], name: "index_memberships_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "title"
    t.boolean "is_personal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "invitations", "memberships", column: "from_membership_id"
  add_foreign_key "invitations", "teams"
  add_foreign_key "memberships", "teams"
end
