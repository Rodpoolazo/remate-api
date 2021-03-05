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

ActiveRecord::Schema.define(version: 2021_03_05_022515) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_types", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bank_id"
    t.index ["bank_id"], name: "index_account_types_on_bank_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.bigint "number"
    t.integer "person_id"
    t.string "person_type"
    t.integer "status"
    t.bigint "account_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_type_id"], name: "index_accounts_on_account_type_id"
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "activities", force: :cascade do |t|
    t.string "code"
    t.string "name_activity"
    t.string "afect_iva"
    t.integer "category"
    t.string "rubro"
    t.string "activityable_type"
    t.bigint "activityable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activityable_id", "activityable_type"], name: "index_activities_on_activityable_id_and_activityable_type"
    t.index ["activityable_type", "activityable_id"], name: "index_activities_on_activityable_type_and_activityable_id"
  end

  create_table "adjustment_pays", force: :cascade do |t|
    t.date "pay_day"
    t.integer "total"
    t.string "payment_gloss"
    t.integer "way_to_pay"
    t.integer "payment_method"
    t.integer "customer_pays_type"
    t.integer "customer_id"
    t.integer "customer_account"
    t.integer "deposit_id"
    t.integer "deposit_account"
    t.bigint "gasto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "deposit_type"
    t.index ["gasto_id"], name: "index_adjustment_pays_on_gasto_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "appraisals", force: :cascade do |t|
    t.date "date"
    t.string "entity"
    t.float "price_uf"
    t.float "price_clp"
    t.float "price_usd"
    t.string "observation"
    t.bigint "realty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_name"
    t.integer "price_euro"
    t.integer "persona_id"
    t.string "persona_type"
    t.index ["realty_id"], name: "index_appraisals_on_realty_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "auctionlistings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attached"
  end

  create_table "auctionnotices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "auction"
    t.integer "status", default: 0
  end

  create_table "auctions", force: :cascade do |t|
    t.date "date"
    t.time "hour"
    t.float "cost"
    t.float "uf"
    t.float "pesos"
    t.float "total_minimum"
    t.float "warranty"
    t.float "fee"
    t.string "name"
    t.bigint "auctionnotice_id"
    t.bigint "realty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "minimum"
    t.integer "status"
    t.bigint "judgement_id"
    t.date "warranty_date"
    t.time "warranty_time"
    t.index ["auctionnotice_id"], name: "index_auctions_on_auctionnotice_id"
    t.index ["judgement_id"], name: "index_auctions_on_judgement_id"
    t.index ["realty_id"], name: "index_auctions_on_realty_id"
  end

  create_table "auctions_realties", force: :cascade do |t|
    t.integer "auction_id"
    t.bigint "realty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["realty_id"], name: "index_auctions_realties_on_realty_id"
  end

  create_table "auctions_records", force: :cascade do |t|
    t.integer "award_person_id"
    t.integer "auction_id"
    t.date "date"
    t.string "file_name"
    t.float "award_amount"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type_currency"
  end

  create_table "auctions_records_personas", force: :cascade do |t|
    t.integer "auctions_record_id"
    t.integer "persona_id"
    t.string "persona_type"
    t.string "persona_type_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "award_amount"
  end

  create_table "bank_branches", force: :cascade do |t|
    t.string "street"
    t.integer "street_number"
    t.string "phone"
    t.integer "status"
    t.bigint "bank_id"
    t.bigint "commune_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["bank_id"], name: "index_bank_branches_on_bank_id"
    t.index ["commune_id"], name: "index_bank_branches_on_commune_id"
  end

  create_table "banks", force: :cascade do |t|
    t.string "name"
    t.string "web"
    t.integer "status"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_banks_on_country_id"
  end

  create_table "characteristics", force: :cascade do |t|
    t.float "m2_land"
    t.float "m2_built"
    t.string "material"
    t.bigint "realty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "built_year"
    t.index ["realty_id"], name: "index_characteristics_on_realty_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "post_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "communes", force: :cascade do |t|
    t.string "name"
    t.integer "province_id"
    t.integer "region_id"
    t.integer "cod_treasury"
    t.integer "conara_sii"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "compradors", force: :cascade do |t|
    t.integer "persona_id"
    t.integer "acciones"
    t.integer "percentage"
    t.string "type_member"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "domain_rol_id"
    t.integer "precio"
    t.index ["domain_rol_id"], name: "index_compradors_on_domain_rol_id"
  end

  create_table "condominios", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.bigint "commune_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "legal_persona_id"
    t.index ["commune_id"], name: "index_condominios_on_commune_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_name"
  end

  create_table "courts", force: :cascade do |t|
    t.string "name"
    t.string "rut"
    t.string "address"
    t.string "phone"
    t.integer "account"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "directions", force: :cascade do |t|
    t.string "rut"
    t.string "directionable_type"
    t.bigint "directionable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "realties_id"
    t.index ["directionable_id", "directionable_type"], name: "index_directions_on_directionable_id_and_directionable_type"
    t.index ["directionable_type", "directionable_id"], name: "index_directions_on_directionable_type_and_directionable_id"
    t.index ["realties_id"], name: "index_directions_on_realties_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "domain_title"
    t.string "gp"
    t.string "tax_appraisal"
    t.bigint "realty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["realty_id"], name: "index_documents_on_realty_id"
  end

  create_table "domain_rols", force: :cascade do |t|
    t.string "type_member"
    t.string "type_rol"
    t.integer "persona_id"
    t.bigint "domain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "percentage"
    t.integer "precio"
    t.integer "acciones_venta"
    t.index ["domain_id"], name: "index_domain_rols_on_domain_id"
  end

  create_table "domainfiles", force: :cascade do |t|
    t.string "file_name"
    t.string "obs_string"
    t.date "date"
    t.bigint "domain_id"
    t.index ["domain_id"], name: "index_domainfiles_on_domain_id"
  end

  create_table "domains", force: :cascade do |t|
    t.string "type_modality"
    t.integer "price"
    t.date "date_posetion"
    t.string "domainable_type"
    t.bigint "domainable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "percentage"
    t.integer "notario_id"
    t.integer "valor"
    t.index ["domainable_id", "domainable_type"], name: "index_domains_on_domainable_id_and_domainable_type"
    t.index ["domainable_type", "domainable_id"], name: "index_domains_on_domainable_type_and_domainable_id"
  end

  create_table "emails", force: :cascade do |t|
    t.string "emailable_type"
    t.bigint "emailable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.index ["emailable_id", "emailable_type"], name: "index_emails_on_emailable_id_and_emailable_type"
    t.index ["emailable_type", "emailable_id"], name: "index_emails_on_emailable_type_and_emailable_id"
  end

  create_table "file_uploads", force: :cascade do |t|
    t.string "file_name"
    t.string "model"
    t.integer "model_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "description"
    t.string "original_file_name"
    t.integer "status"
  end

  create_table "forma_pagos", force: :cascade do |t|
    t.string "nombre_pago"
    t.integer "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gastos", force: :cascade do |t|
    t.date "fecha_limite"
    t.integer "realty_id"
    t.string "tipo_gasto"
    t.integer "total_gasto"
    t.string "tipo_persona_ingresa"
    t.integer "persona_id_ingresa"
    t.string "tipo_persona_paga"
    t.integer "persona_id_paga"
    t.string "folio"
    t.string "observacion"
    t.string "documentacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "historicos", force: :cascade do |t|
    t.integer "persona_id"
    t.string "type_member"
    t.integer "legal_persona_id"
    t.date "entrada"
    t.date "salida"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "valor"
    t.integer "acciones"
  end

  create_table "inscriptionfiles", force: :cascade do |t|
    t.string "file_name"
    t.string "obs"
    t.date "date"
    t.bigint "inscription_id"
    t.index ["inscription_id"], name: "index_inscriptionfiles_on_inscription_id"
  end

  create_table "inscriptions", force: :cascade do |t|
    t.integer "foja"
    t.integer "number"
    t.integer "year"
    t.string "cbrs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "domain_id"
    t.date "date"
    t.index ["domain_id"], name: "index_inscriptions_on_domain_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "rut"
    t.string "position"
    t.integer "salary"
    t.string "business"
    t.text "description"
    t.bigint "persona_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["persona_id"], name: "index_jobs_on_persona_id"
  end

  create_table "judgement_debts", force: :cascade do |t|
    t.integer "person_id"
    t.string "person_type"
    t.integer "money_total"
    t.integer "money_type"
    t.date "debt_date"
    t.integer "debt_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "judgement_id"
    t.index ["judgement_id"], name: "index_judgement_debts_on_judgement_id"
  end

  create_table "judgement_personas", force: :cascade do |t|
    t.integer "judgement_id"
    t.integer "persona_id"
    t.string "persona_type"
    t.string "judgement_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "judgement_realties", force: :cascade do |t|
    t.integer "judgement_id"
    t.integer "realty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "judgements", force: :cascade do |t|
    t.integer "type_judgement", default: 0
    t.string "lyrics"
    t.integer "number"
    t.integer "year"
    t.bigint "court_id"
    t.string "demandante"
    t.string "demandado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.index ["court_id"], name: "index_judgements_on_court_id"
  end

  create_table "judicialfiles", force: :cascade do |t|
    t.date "date"
    t.string "obs"
    t.bigint "judgement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_name"
    t.index ["judgement_id"], name: "index_judicialfiles_on_judgement_id"
  end

  create_table "legal_members", force: :cascade do |t|
    t.bigint "legal_persona_id"
    t.bigint "legal_asociado_id"
    t.float "percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["legal_asociado_id"], name: "index_legal_members_on_legal_asociado_id"
    t.index ["legal_persona_id"], name: "index_legal_members_on_legal_persona_id"
  end

  create_table "legal_personas", force: :cascade do |t|
    t.string "rut"
    t.string "name"
    t.string "fantasy_name"
    t.string "alias"
    t.string "web"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "acciones"
    t.bigint "total"
    t.date "fecha_cese"
    t.string "estado"
  end

  create_table "legal_represents", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "legal_persona_id"
    t.integer "persona_id"
    t.string "type_represents"
    t.date "entrada"
    t.index ["legal_persona_id"], name: "index_legal_represents_on_legal_persona_id"
  end

  create_table "login_activities", force: :cascade do |t|
    t.string "scope"
    t.string "strategy"
    t.string "identity"
    t.boolean "success"
    t.string "failure_reason"
    t.string "user_type"
    t.bigint "user_id"
    t.string "context"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.string "city"
    t.string "region"
    t.string "country"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at"
    t.index ["identity"], name: "index_login_activities_on_identity"
    t.index ["ip"], name: "index_login_activities_on_ip"
    t.index ["user_type", "user_id"], name: "index_login_activities_on_user_type_and_user_id"
  end

  create_table "medio_pagos", force: :cascade do |t|
    t.string "nombre_medio_pago"
    t.integer "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "modulos", force: :cascade do |t|
    t.string "description"
    t.string "llave"
  end

  create_table "pagos", force: :cascade do |t|
    t.date "fecha_pago"
    t.string "forma_pago"
    t.string "medio_pago"
    t.integer "total_pago"
    t.integer "cliente_id"
    t.integer "estado_pago"
    t.string "glosa_de_pago"
    t.bigint "gasto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cuenta_cliente"
    t.integer "tipo_depositado"
    t.integer "depositado_id"
    t.integer "cuenta_depositado"
    t.integer "tipo_cliente"
    t.index ["gasto_id"], name: "index_pagos_on_gasto_id"
  end

  create_table "persona_members", force: :cascade do |t|
    t.bigint "legal_persona_id", null: false
    t.float "percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type_member"
    t.integer "persona_id"
    t.integer "acciones"
    t.date "entrada"
    t.integer "capital_actual"
    t.integer "valor"
    t.index ["legal_persona_id"], name: "index_persona_members_on_legal_persona_id"
  end

  create_table "personas", force: :cascade do |t|
    t.string "name"
    t.string "name2"
    t.string "rut"
    t.string "last_name1"
    t.string "last_name2"
    t.string "e_civil"
    t.string "profesion"
    t.date "birth_date"
    t.string "nacionality"
    t.string "passport"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "fecha_defuncion"
  end

  create_table "phones", force: :cascade do |t|
    t.string "phoneable_type"
    t.bigint "phoneable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "number_phone"
    t.string "type_phone"
    t.index ["phoneable_id", "phoneable_type"], name: "index_phones_on_phoneable_id_and_phoneable_type"
    t.index ["phoneable_type", "phoneable_id"], name: "index_phones_on_phoneable_type_and_phoneable_id"
  end

  create_table "population_villas", force: :cascade do |t|
    t.integer "id_comuna"
    t.string "nombre"
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "profile_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "modulos", default: [], array: true
  end

  create_table "provinces", force: :cascade do |t|
    t.integer "province_id"
    t.string "name"
    t.integer "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publications", force: :cascade do |t|
    t.integer "rent"
    t.integer "sell"
    t.bigint "realty_id"
    t.integer "rent_season"
    t.index ["realty_id"], name: "index_publications_on_realty_id"
  end

  create_table "realties", force: :cascade do |t|
    t.integer "commune_id"
    t.string "street"
    t.string "number_unit"
    t.string "unit_estate"
    t.integer "street_type_id"
    t.integer "apple"
    t.integer "property"
    t.text "name_realty"
    t.float "mt2_land"
    t.float "mt2_built"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.integer "type_property_id"
    t.integer "province_id"
    t.string "fiscal_destination"
    t.integer "condominio_id"
    t.integer "population_villa"
    t.bigint "user_id"
    t.integer "associated_realty", default: [], array: true
    t.index ["user_id"], name: "index_realties_on_user_id"
  end

  create_table "realty_compradors", force: :cascade do |t|
    t.integer "persona_id"
    t.string "type_member"
    t.integer "precio"
    t.integer "percentage"
    t.bigint "realty_domainrols_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["realty_domainrols_id"], name: "index_realty_compradors_on_realty_domainrols_id"
  end

  create_table "realty_domainfiles", force: :cascade do |t|
    t.string "file_name"
    t.string "observation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "realty_domains_id"
    t.date "date"
    t.index ["realty_domains_id"], name: "index_realty_domainfiles_on_realty_domains_id"
  end

  create_table "realty_domainrols", force: :cascade do |t|
    t.string "type_member"
    t.string "type_rol"
    t.integer "persona_id"
    t.bigint "realty_domains_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "percentage"
    t.integer "valor"
    t.integer "cantidad"
    t.index ["realty_domains_id"], name: "index_realty_domainrols_on_realty_domains_id"
  end

  create_table "realty_domains", force: :cascade do |t|
    t.string "type_modality"
    t.integer "price"
    t.date "date_posetion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "percentage"
    t.integer "notario_id"
    t.string "observation"
    t.integer "realty_id"
    t.string "type_currency"
    t.string "notario_type"
    t.integer "precio_uf"
    t.integer "precio_usd"
    t.integer "precio_euro"
  end

  create_table "realty_dueno_historicos", force: :cascade do |t|
    t.integer "persona_id"
    t.integer "realty_id"
    t.string "type_member"
    t.date "salida"
    t.date "entrada"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "porcentaje_e"
    t.integer "porcentaje_s"
    t.integer "precio_e"
    t.integer "precio_s"
  end

  create_table "realty_duenos", force: :cascade do |t|
    t.integer "persona_id"
    t.integer "realty_id"
    t.string "type_member"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "percentage"
    t.date "entrada"
  end

  create_table "realty_inscriptionfiles", force: :cascade do |t|
    t.string "file_name"
    t.string "observation"
    t.date "date"
    t.bigint "realty_inscription_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["realty_inscription_id"], name: "index_realty_inscriptionfiles_on_realty_inscription_id"
  end

  create_table "realty_inscriptions", force: :cascade do |t|
    t.integer "foja"
    t.integer "number"
    t.integer "year"
    t.string "cbrs"
    t.date "date"
    t.bigint "realty_domains_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["realty_domains_id"], name: "index_realty_inscriptions_on_realty_domains_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.integer "number_region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "representante_historicos", force: :cascade do |t|
    t.integer "persona_id"
    t.date "entrada"
    t.date "salida"
    t.integer "legal_persona_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rubros", force: :cascade do |t|
    t.string "nombre"
  end

  create_table "tipo_gastos", force: :cascade do |t|
    t.string "nombre_gasto"
    t.integer "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_realties", force: :cascade do |t|
    t.integer "tipo"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "realty_id"
    t.integer "bathroom"
    t.integer "parking_lot"
    t.integer "cellar"
    t.integer "bedroom"
    t.integer "ambient"
    t.index ["realty_id"], name: "index_type_realties_on_realty_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.integer "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 4
    t.string "name"
    t.float "Latitude"
    t.float "longitude"
    t.string "address"
    t.string "provider"
    t.string "uid"
    t.string "rut"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_order_temporals", force: :cascade do |t|
    t.string "name"
    t.string "type_name"
    t.integer "work_order_id"
    t.integer "status"
  end

  create_table "work_order_types", force: :cascade do |t|
    t.string "type_name"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_orders", force: :cascade do |t|
    t.integer "realty_id"
    t.integer "author"
    t.string "type_responsable"
    t.integer "responsable"
    t.string "type_awarded"
    t.integer "awarded"
    t.integer "money"
    t.date "start_date"
    t.date "finish_date"
    t.integer "status"
    t.string "description"
    t.integer "work_order_type_id"
    t.integer "spend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "type_currency"
  end

  add_foreign_key "account_types", "banks"
  add_foreign_key "accounts", "account_types"
  add_foreign_key "adjustment_pays", "gastos"
  add_foreign_key "appraisals", "realties"
  add_foreign_key "auctions", "auctionnotices"
  add_foreign_key "auctions", "judgements"
  add_foreign_key "auctions", "realties"
  add_foreign_key "auctions_realties", "realties"
  add_foreign_key "bank_branches", "banks"
  add_foreign_key "bank_branches", "communes"
  add_foreign_key "banks", "countries"
  add_foreign_key "characteristics", "realties"
  add_foreign_key "comments", "posts"
  add_foreign_key "compradors", "domain_rols"
  add_foreign_key "condominios", "communes"
  add_foreign_key "directions", "realties", column: "realties_id"
  add_foreign_key "documents", "realties"
  add_foreign_key "domain_rols", "domains"
  add_foreign_key "domainfiles", "domains"
  add_foreign_key "inscriptionfiles", "inscriptions"
  add_foreign_key "inscriptions", "domains"
  add_foreign_key "jobs", "personas"
  add_foreign_key "judgement_debts", "judgements"
  add_foreign_key "judgements", "courts"
  add_foreign_key "judicialfiles", "judgements"
  add_foreign_key "legal_members", "legal_personas"
  add_foreign_key "legal_members", "legal_personas", column: "legal_asociado_id"
  add_foreign_key "legal_represents", "legal_personas"
  add_foreign_key "pagos", "gastos"
  add_foreign_key "persona_members", "legal_personas"
  add_foreign_key "posts", "users"
  add_foreign_key "publications", "realties"
  add_foreign_key "realties", "users"
  add_foreign_key "realty_compradors", "realty_domainrols", column: "realty_domainrols_id"
  add_foreign_key "realty_domainfiles", "realty_domains", column: "realty_domains_id"
  add_foreign_key "realty_domainrols", "realty_domains", column: "realty_domains_id"
  add_foreign_key "realty_inscriptionfiles", "realty_inscriptions"
  add_foreign_key "realty_inscriptions", "realty_domains", column: "realty_domains_id"
  add_foreign_key "type_realties", "realties"
end
