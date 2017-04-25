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

ActiveRecord::Schema.define(version: 20170422212722) do

  create_table "expenses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "profile_id"
    t.string   "name"
    t.integer  "category"
    t.integer  "amount_cent"
    t.datetime "date"
    t.integer  "monthly_stat_id"
    t.integer  "periodic_expense_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "incomes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "profile_id"
    t.string   "name"
    t.integer  "category"
    t.integer  "amount_cent"
    t.datetime "date"
    t.integer  "monthly_stat_id"
    t.integer  "periodic_income_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "monthly_stats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "profile_id"
    t.datetime "date"
    t.integer  "balance_cent"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["profile_id", "date"], name: "index_monthly_stats_on_profile_id_and_date", unique: true, using: :btree
  end

  create_table "periodic_expenses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "profile_id"
    t.string   "name"
    t.integer  "period"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer  "period_amount_cent"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "periodic_incomes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "profile_id"
    t.string   "name"
    t.integer  "period"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer  "period_amount_cent"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
