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

ActiveRecord::Schema[7.0].define(version: 2023_08_29_133213) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bdclientes", force: :cascade do |t|
    t.string "nome_empresa"
    t.string "site"
    t.integer "ativo_inativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bdleituras", force: :cascade do |t|
    t.float "valor"
    t.bigint "bdsensor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bdsensor_id"], name: "index_bdleituras_on_bdsensor_id"
  end

  create_table "bdsensors", force: :cascade do |t|
    t.string "nome_sensor"
    t.integer "time_read"
    t.string "LI"
    t.string "LS"
    t.string "arg1"
    t.string "arg2"
    t.string "arg3"
    t.string "arg4"
    t.string "arg5"
    t.integer "flag_notificacao"
    t.integer "flag_rearme"
    t.integer "flag_mantec"
    t.integer "ativo_inativo"
    t.bigint "bdtipo_id", null: false
    t.bigint "bdcliente_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bdcliente_id"], name: "index_bdsensors_on_bdcliente_id"
    t.index ["bdtipo_id"], name: "index_bdsensors_on_bdtipo_id"
  end

  create_table "bdtipos", force: :cascade do |t|
    t.string "tipo_sensor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bdusuarios", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "CPF"
    t.string "celular"
    t.string "senha"
    t.string "SMS"
    t.integer "ativo_inativo"
    t.bigint "bdcliente_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bdcliente_id"], name: "index_bdusuarios_on_bdcliente_id"
  end

  add_foreign_key "bdleituras", "bdsensors"
  add_foreign_key "bdsensors", "bdclientes"
  add_foreign_key "bdsensors", "bdtipos"
  add_foreign_key "bdusuarios", "bdclientes"
end
