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

ActiveRecord::Schema.define(version: 20150904165242) do

  create_table "atividades", force: :cascade do |t|
    t.string   "descricao",     limit: 255
    t.integer  "modalidade_id", limit: 4
    t.integer  "aluno_id",      limit: 4
    t.integer  "horas_req",     limit: 4
    t.integer  "horas_jul",     limit: 4
    t.string   "anexo",         limit: 255
    t.integer  "julgador_id",   limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "atividades", ["aluno_id"], name: "index_atividades_on_aluno_id", using: :btree
  add_index "atividades", ["julgador_id"], name: "index_atividades_on_julgador_id", using: :btree
  add_index "atividades", ["modalidade_id"], name: "index_atividades_on_modalidade_id", using: :btree

  create_table "modalidades", force: :cascade do |t|
    t.string   "titulo",     limit: 255
    t.integer  "limite",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: ""
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nome",                   limit: 255
    t.string   "matricula",              limit: 255
    t.string   "curso",                  limit: 255
    t.string   "tipo",                   limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "invitation_token",       limit: 255
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit",       limit: 4
    t.integer  "invited_by_id",          limit: 4
    t.string   "invited_by_type",        limit: 255
    t.integer  "invitations_count",      limit: 4,   default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "usuarios", force: :cascade do |t|
    t.string   "nome",         limit: 255
    t.string   "email",        limit: 255
    t.string   "matricula",    limit: 255
    t.string   "curso",        limit: 255
    t.string   "tipo",         limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.datetime "confirmed_at"
  end

  add_foreign_key "atividades", "modalidades"
end
