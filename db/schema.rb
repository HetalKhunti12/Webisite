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

ActiveRecord::Schema.define(version: 20170315120443) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abas", force: :cascade do |t|
    t.text     "txt"
    t.integer  "transfer_group_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.decimal  "ent_oz_exp_ex_gst"
    t.decimal  "ent_oz_exp_gst"
    t.decimal  "commission_ex_gst"
    t.decimal  "commission_gst"
    t.datetime "transfers_reconciliation"
  end

  add_index "abas", ["transfer_group_id"], name: "index_abas_on_transfer_group_id", using: :btree

  create_table "about_us", force: :cascade do |t|
    t.text     "context"
    t.string   "about_us_image_file_name"
    t.string   "about_us_image_content_type"
    t.integer  "about_us_image_file_size"
    t.datetime "about_us_image_updated_at"
    t.string   "about_us_video_file_name"
    t.string   "about_us_video_content_type"
    t.integer  "about_us_video_file_size"
    t.datetime "about_us_video_updated_at"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "artist_profiles", force: :cascade do |t|
    t.integer  "p_profile_type"
    t.string   "p_bsb"
    t.integer  "contact_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "category_id"
    t.text     "short_description"
    t.text     "long_description"
    t.text     "keywords"
    t.text     "price"
    t.boolean  "approved",                default: false
    t.boolean  "published",               default: false
    t.string   "title"
    t.string   "state"
    t.string   "location2"
    t.string   "country"
    t.integer  "sub_category_id"
    t.string   "slug"
    t.decimal  "other_price"
    t.boolean  "country_wide",            default: false
    t.text     "travel_information"
    t.datetime "access_time"
    t.text     "access_time_note"
    t.datetime "sound_check_time"
    t.text     "sound_check_time_note"
    t.datetime "guest_arrival_time"
    t.text     "guest_arrival_time_note"
    t.string   "stage_size"
    t.text     "load_in_directions"
    t.integer  "quantity",                default: 1
  end

  create_table "artist_service_orders", force: :cascade do |t|
    t.text     "description"
    t.datetime "service_start"
    t.string   "service_duration"
    t.string   "so_summary"
    t.text     "so_description"
    t.integer  "customer_price"
    t.decimal  "artist_fee"
    t.boolean  "fee_inc_gst"
    t.boolean  "price_inc_gst"
    t.decimal  "total_customer_price"
    t.decimal  "total_artist_fee"
    t.datetime "service_end"
    t.string   "total_performance_duration"
    t.string   "callout_duration"
    t.decimal  "new_artist_fee_cents"
    t.decimal  "gross_commission_percent"
    t.decimal  "apply_rounding"
    t.decimal  "artist_fee_rounded"
    t.boolean  "accommodation_req"
    t.boolean  "travel_req"
    t.boolean  "ground_transfers_req"
    t.boolean  "meals_req"
    t.boolean  "artist_equipment_req"
    t.boolean  "artist_equipment_conf"
    t.boolean  "meals_conf"
    t.boolean  "ground_transfers_conf"
    t.boolean  "travel_conf"
    t.boolean  "accommodation_conf"
    t.string   "event_type"
    t.string   "number_of_guests"
    t.string   "contact_person_on_day"
    t.string   "contact_mobile_on_day"
    t.string   "venue_type"
    t.string   "venue_name"
    t.text     "venue_address"
    t.text     "venue_notes"
    t.string   "event_type_other"
    t.string   "venue_type_other"
    t.integer  "artist_profile_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "contact_id"
  end

  create_table "availables", force: :cascade do |t|
    t.string   "title"
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "allDay"
    t.integer  "artist_profile_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "contact_id"
  end

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "avg",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banners", force: :cascade do |t|
    t.string   "title"
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.integer  "category_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.text     "context"
    t.string   "blog_image_file_name"
    t.string   "blog_image_content_type"
    t.integer  "blog_image_file_size"
    t.datetime "blog_image_updated_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "booking_changes", force: :cascade do |t|
    t.datetime "service_start"
    t.datetime "service_end"
    t.string   "event_type"
    t.string   "venue_type"
    t.string   "number_of_guests"
    t.text     "contact_person_on_day"
    t.text     "contact_mobile_on_day"
    t.string   "venue_name"
    t.text     "venue_address"
    t.text     "venue_notes"
    t.integer  "booking_id"
    t.integer  "profile_order_id"
    t.integer  "service_order_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "form_sent"
    t.datetime "form_returned"
    t.integer  "venue_type"
    t.string   "venue_name"
    t.string   "venue_address"
    t.float    "venue_lat"
    t.float    "venue_lon"
    t.string   "venue_state"
    t.text     "venue_notes"
    t.integer  "customer_id"
    t.boolean  "deleted"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.datetime "access_time"
    t.datetime "guest_arrival_time"
    t.datetime "sound_check_time"
    t.string   "stage_size"
    t.string   "number_of_guests"
    t.text     "load_in_directions"
    t.string   "contact_person_on_day"
    t.string   "contact_mobile_on_day"
    t.string   "customer_billing_name"
    t.string   "customer_billing_address"
    t.string   "customer_surname"
    t.string   "customer_firstname"
    t.string   "customer_email"
    t.string   "customer_phone"
    t.string   "customer_mobile"
    t.string   "customer_address"
    t.string   "customer_fax"
    t.string   "customer_company_name"
    t.string   "customer_company_abn"
    t.datetime "arrival_time"
    t.string   "dress_requirements"
    t.string   "talents_role"
    t.string   "travel_transport"
    t.string   "accomodation"
    t.text     "special_instructions"
    t.text     "run_sheet"
    t.integer  "staff_responsible_id"
    t.datetime "form_due_date"
    t.string   "number"
    t.boolean  "payment_method"
    t.string   "customer_salutation"
    t.string   "event_type"
    t.string   "venue_type_other"
    t.string   "event_type_other"
    t.datetime "booking_cancelled"
    t.string   "customer_invoice_number"
    t.string   "customer_po_number"
    t.string   "follow_up_status"
    t.boolean  "completed",                default: false,     null: false
    t.string   "venue_type_text"
    t.boolean  "standard_req"
    t.boolean  "travel_req"
    t.boolean  "production_req"
    t.boolean  "run_sheet_req"
    t.boolean  "standard_conf"
    t.boolean  "travel_conf"
    t.boolean  "production_conf"
    t.boolean  "run_sheet_conf"
    t.boolean  "old_invoicing",            default: false,     null: false
    t.text     "msg"
    t.text     "client_cancellation_msg"
    t.text     "artist_cancellation_msg"
    t.integer  "inquiry_id"
    t.text     "signature"
    t.boolean  "paid",                     default: true
    t.boolean  "multiple_venue",           default: false
    t.string   "booking_type",             default: "finance"
  end

  add_index "bookings", ["customer_id"], name: "index_bookings_on_customer_id", using: :btree

  create_table "card_transactions", force: :cascade do |t|
    t.integer  "card_id"
    t.string   "action"
    t.integer  "amount"
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "card_transactions", ["card_id"], name: "index_card_transactions_on_card_id", using: :btree

  create_table "cards", force: :cascade do |t|
    t.integer  "contacts_id"
    t.string   "ip_address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "card_type"
    t.date     "card_expires_on"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "contact_payment_id"
    t.string   "profile_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "url_path"
    t.string   "ancestry"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.text     "meta_decription"
    t.string   "slug"
  end

  add_index "categories", ["ancestry"], name: "index_categories_on_ancestry", using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "commontator_comments", force: :cascade do |t|
    t.string   "creator_type"
    t.integer  "creator_id"
    t.string   "editor_type"
    t.integer  "editor_id"
    t.integer  "thread_id",                     null: false
    t.text     "body",                          null: false
    t.datetime "deleted_at"
    t.integer  "cached_votes_up",   default: 0
    t.integer  "cached_votes_down", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commontator_comments", ["cached_votes_down"], name: "index_commontator_comments_on_cached_votes_down", using: :btree
  add_index "commontator_comments", ["cached_votes_up"], name: "index_commontator_comments_on_cached_votes_up", using: :btree
  add_index "commontator_comments", ["creator_id", "creator_type", "thread_id"], name: "index_commontator_comments_on_c_id_and_c_type_and_t_id", using: :btree
  add_index "commontator_comments", ["thread_id", "created_at"], name: "index_commontator_comments_on_thread_id_and_created_at", using: :btree

  create_table "commontator_subscriptions", force: :cascade do |t|
    t.string   "subscriber_type", null: false
    t.integer  "subscriber_id",   null: false
    t.integer  "thread_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commontator_subscriptions", ["subscriber_id", "subscriber_type", "thread_id"], name: "index_commontator_subscriptions_on_s_id_and_s_type_and_t_id", unique: true, using: :btree
  add_index "commontator_subscriptions", ["thread_id"], name: "index_commontator_subscriptions_on_thread_id", using: :btree

  create_table "commontator_threads", force: :cascade do |t|
    t.string   "commontable_type"
    t.integer  "commontable_id"
    t.datetime "closed_at"
    t.string   "closer_type"
    t.integer  "closer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commontator_threads", ["commontable_id", "commontable_type"], name: "index_commontator_threads_on_c_id_and_c_type", unique: true, using: :btree

  create_table "communications", force: :cascade do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "sender_id"
    t.integer  "reciever_id"
    t.integer  "contact_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "contact_payments", force: :cascade do |t|
    t.string   "payment_type"
    t.datetime "payment_date"
    t.integer  "contact_id"
    t.decimal  "amount"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "payment_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "display_name"
    t.string   "salutation"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mobile_phone"
    t.string   "work_email"
    t.string   "work_phone"
    t.string   "work_address"
    t.string   "work_city"
    t.string   "work_state"
    t.string   "work_country"
    t.string   "work_postcode"
    t.string   "personal_email"
    t.string   "home_phone"
    t.string   "home_address"
    t.string   "home_city"
    t.string   "home_state"
    t.string   "home_country"
    t.string   "home_postcode"
    t.string   "category"
    t.string   "company"
    t.string   "fax"
    t.text     "notes"
    t.string   "abn"
    t.string   "billing_name"
    t.string   "billing_address"
    t.string   "bsb"
    t.string   "account"
    t.boolean  "invoicing_with_gst"
    t.decimal  "comission_percent"
    t.string   "contact_type"
    t.datetime "created_at",                     precision: 6,                 null: false
    t.datetime "updated_at",                     precision: 6,                 null: false
    t.boolean  "statement_by_suppier_exemption",               default: false
    t.datetime "lisa_updated_at"
    t.boolean  "old_invoicing"
    t.string   "password"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "website"
    t.string   "email_format"
    t.string   "address"
    t.string   "encrypted_password"
    t.integer  "role_id"
    t.integer  "package_id"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "contacts", ["reset_password_token"], name: "index_contacts_on_reset_password_token", unique: true, using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "surname"
    t.string   "firstname"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.integer  "user_id"
    t.boolean  "deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "customers", ["user_id"], name: "index_customers_on_user_id", using: :btree

  create_table "expenses", force: :cascade do |t|
    t.integer  "booking_id"
    t.string   "description"
    t.decimal  "amount"
    t.datetime "date_incurred"
    t.datetime "date_invoiced"
    t.string   "gst_type"
    t.integer  "profile_order_id"
    t.boolean  "commission_applies", default: false, null: false
  end

  add_index "expenses", ["booking_id"], name: "index_expenses_on_booking_id", using: :btree
  add_index "expenses", ["profile_order_id"], name: "index_expenses_on_profile_order_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "how_it_works", force: :cascade do |t|
    t.text     "context"
    t.string   "how_it_works_image_file_name"
    t.string   "how_it_works_image_content_type"
    t.integer  "how_it_works_image_file_size"
    t.datetime "how_it_works_image_updated_at"
    t.string   "how_it_works_video_file_name"
    t.string   "how_it_works_video_content_type"
    t.integer  "how_it_works_video_file_size"
    t.datetime "how_it_works_video_updated_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "alt",               default: ""
    t.string   "hint",              default: ""
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.text     "params"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "inquiries", force: :cascade do |t|
    t.string   "artist_name"
    t.date     "date"
    t.time     "time"
    t.string   "location"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "performance_length"
    t.string   "venue_type"
    t.string   "venue_type_other"
    t.string   "event_type"
    t.string   "no_of_person"
    t.string   "event_detail"
    t.string   "other_entertainers"
    t.string   "other_entertainment"
    t.integer  "event_budget"
    t.string   "client_number"
    t.string   "client_name"
    t.string   "client_company"
    t.string   "address"
    t.string   "client_city"
    t.string   "email"
    t.string   "phone"
    t.integer  "fax"
    t.boolean  "newsletter"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.float    "include_gst"
    t.datetime "send_date"
    t.boolean  "special_client",      default: false
    t.boolean  "multiple_venue",      default: false
    t.boolean  "approved",            default: false
    t.text     "client_comment"
    t.text     "artist_comment"
  end

  create_table "inquiry_profiles", force: :cascade do |t|
    t.integer  "inquiry_id"
    t.integer  "contact_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "artist_type"
    t.date     "date"
    t.time     "time"
    t.integer  "performance_length"
    t.string   "profile_name"
    t.integer  "artist_service_order_id"
    t.boolean  "old_invoicing",           default: false
    t.boolean  "invoicing_with_gst",      default: false
    t.datetime "access_time"
    t.text     "access_time_note"
    t.datetime "sound_check_time"
    t.text     "sound_check_time_note"
    t.datetime "guest_arrival_time"
    t.text     "guest_arrival_time_note"
    t.string   "stage_size"
    t.text     "load_in_directions"
  end

  create_table "invoice_payments", force: :cascade do |t|
    t.integer  "booking_id"
    t.string   "description"
    t.decimal  "amount"
    t.decimal  "gst"
    t.datetime "invoice_send_date"
    t.datetime "invoice_pay_by_date"
    t.datetime "deleted_at"
    t.string   "number"
    t.text     "msg"
  end

  add_index "invoice_payments", ["booking_id"], name: "index_invoice_payments_on_booking_id", using: :btree

  create_table "issue_milestones", force: :cascade do |t|
    t.string   "title"
    t.date     "due"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issues", force: :cascade do |t|
    t.string   "summary"
    t.text     "details"
    t.integer  "user_id"
    t.string   "priority"
    t.string   "status"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "assigned_to_id"
    t.integer  "issue_milestone_id"
  end

  add_index "issues", ["issue_milestone_id"], name: "index_issues_on_issue_milestone_id", using: :btree
  add_index "issues", ["user_id"], name: "index_issues_on_user_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "listings", force: :cascade do |t|
    t.string   "objectTitle"
    t.string   "objectLocation1"
    t.string   "objectLocation2"
    t.string   "objectCountry"
    t.integer  "objectPrimaryCategoryID"
    t.integer  "objectRootCategoryId"
    t.string   "objectDescription1"
    t.text     "objectDescription2"
    t.text     "objectKeywords"
    t.text     "objectPricing"
    t.integer  "objectEnabled"
    t.datetime "dateLevelExpires"
    t.integer  "objectTypeID"
    t.integer  "objectStatus"
    t.string   "objectApproved"
    t.integer  "contact_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "audio_file_name"
    t.string   "audio_content_type"
    t.integer  "audio_file_size"
    t.datetime "audio_updated_at"
  end

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.integer "unsubscriber_id"
    t.string  "unsubscriber_type"
    t.integer "conversation_id"
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type", using: :btree

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "is_delivered",               default: false
    t.string   "delivery_method"
    t.string   "message_id"
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree

  create_table "overall_averages", force: :cascade do |t|
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "packages", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_components", force: :cascade do |t|
    t.string   "description"
    t.text     "entoz_notes"
    t.datetime "due"
    t.datetime "paid"
    t.decimal  "artist_ex_gst"
    t.decimal  "artist_gst"
    t.decimal  "commission_ex_gst"
    t.decimal  "commission_gst"
    t.decimal  "ent_oz_exp_ex_gst"
    t.decimal  "ent_oz_exp_gst"
    t.decimal  "artist_exp_ex_gst"
    t.decimal  "artist_exp_gst"
    t.decimal  "surcharge_ex_gst"
    t.decimal  "surcharge_gst"
    t.string   "status"
    t.integer  "transfer_group_id"
    t.integer  "booking_id"
    t.integer  "pay_componentable_id"
    t.string   "pay_componentable_type"
    t.integer  "payment_receivable_id"
    t.string   "payment_sourceable_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "payment_components", ["pay_componentable_id"], name: "index_payment_components_on_pay_componentable_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profile_contents", force: :cascade do |t|
    t.integer  "artist_profile_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "title"
    t.string   "certificate_file_name"
    t.string   "certificate_content_type"
    t.integer  "certificate_file_size"
    t.datetime "certificate_updated_at"
  end

  create_table "profile_images", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "title"
    t.text     "description"
    t.integer  "artist_profile_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "profile_orders", force: :cascade do |t|
    t.integer  "booking_id"
    t.integer  "profile_id"
    t.string   "p_name"
    t.integer  "p_profile_type"
    t.decimal  "p_comission_percentage"
    t.text     "production_requirements"
    t.string   "purchase_number"
    t.datetime "artist_booking_form_confirmed"
    t.datetime "artist_booking_form_returned"
    t.datetime "artist_invoice_received"
    t.datetime "artist_invoice_paid"
    t.datetime "purchase_order_sent"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.boolean  "invoicing_with_gst"
    t.text     "ryder"
    t.string   "abn"
    t.string   "billing_name"
    t.string   "billing_address"
    t.decimal  "commission_adjustment"
    t.string   "p_phone"
    t.string   "p_bsb"
    t.string   "p_account"
    t.datetime "access_time"
    t.datetime "guest_arrival_time"
    t.datetime "sound_check_time"
    t.string   "stage_size"
    t.text     "load_in_directions"
    t.string   "p_email"
    t.string   "p_first_name"
    t.string   "p_last_name"
    t.string   "p_mobile"
    t.text     "msg"
    t.boolean  "old_invoicing",                 default: false, null: false
    t.text     "access_time_note"
    t.text     "guest_arrival_time_note"
    t.text     "sound_check_time_note"
  end

  add_index "profile_orders", ["booking_id"], name: "index_profile_orders_on_booking_id", using: :btree
  add_index "profile_orders", ["profile_id"], name: "index_profile_orders_on_profile_id", using: :btree

  create_table "profile_payments", force: :cascade do |t|
    t.integer  "profile_order_id"
    t.string   "description"
    t.decimal  "artist_ex_gst"
    t.decimal  "artist_gst"
    t.datetime "invoice_pay_by_date"
    t.datetime "invoice_paid_date"
    t.datetime "deleted_at"
    t.string   "number"
    t.datetime "reconciliation"
    t.datetime "blocked_date"
    t.decimal  "artist_exp_ex_gst"
    t.decimal  "artist_exp_gst"
    t.decimal  "ent_oz_exp_ex_gst"
    t.decimal  "ent_oz_exp_gst"
    t.decimal  "commission_ex_gst"
    t.decimal  "commission_gst"
    t.decimal  "surcharge_ex_gst"
    t.decimal  "surcharge_gst"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "aba_id"
    t.integer  "reconciliation_id"
    t.text     "msg"
    t.text     "account_msg"
    t.string   "flag",                default: "full"
  end

  add_index "profile_payments", ["profile_order_id"], name: "index_profile_payments_on_profile_order_id", using: :btree
  add_index "profile_payments", ["reconciliation_id"], name: "index_profile_payments_on_reconciliation_id", using: :btree

  create_table "profile_services", force: :cascade do |t|
    t.datetime "start_date"
    t.string   "performance_length"
    t.string   "location"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "event_type"
    t.integer  "number_of_guests"
    t.string   "venue_type"
    t.string   "artist_type"
    t.integer  "inquiry_profile_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "event_type_other"
    t.string   "venue_type_other"
    t.datetime "end_date"
    t.decimal  "artist_fee"
    t.decimal  "artist_fee_include_gst"
    t.decimal  "gross_commission_percent", default: 0.0
  end

  create_table "profile_transfers", force: :cascade do |t|
    t.datetime "due"
    t.string   "status"
    t.integer  "booking_id"
    t.datetime "blocked_date"
    t.decimal  "surcharge_ex_gst"
    t.decimal  "surcharge_gst"
    t.decimal  "artist_gst"
    t.decimal  "artist_ex_gst"
    t.decimal  "artist_exp_ex_gst"
    t.decimal  "artist_exp_gst"
    t.decimal  "ent_oz_exp_ex_gst"
    t.decimal  "ent_oz_exp_gst"
    t.decimal  "commission_ex_gst"
    t.decimal  "commission_gst"
    t.datetime "paid_at"
    t.integer  "aba_id"
    t.integer  "reconciliation_id"
    t.integer  "profile_order_id"
    t.boolean  "old_invoicing",     default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "profile_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "priority"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "profile_videos", force: :cascade do |t|
    t.string   "video_url"
    t.string   "title"
    t.text     "description"
    t.integer  "artist_profile_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "profile_type"
    t.float    "comission_percent"
    t.boolean  "deleted"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "gst_registered"
    t.string   "phone"
    t.string   "abn"
    t.string   "billing_name"
    t.string   "billing_address"
    t.string   "bsb"
    t.string   "account"
    t.text     "production_requirements"
    t.boolean  "invoicing_with_gst"
    t.integer  "contact_id"
    t.boolean  "statement_by_suppier_exemption"
  end

  add_index "profiles", ["contact_id"], name: "index_profiles_on_contact_id", using: :btree
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "quotations", force: :cascade do |t|
    t.string   "customer_surname"
    t.string   "customer_firstname"
    t.datetime "service_start"
    t.datetime "service_end"
    t.string   "total_performance_duration"
    t.string   "profile_name"
    t.integer  "profile_id"
    t.decimal  "new_artist_fee_cents"
    t.decimal  "artist_fee_rounded"
    t.decimal  "gross_commission_percent"
    t.boolean  "apply_rounding"
    t.string   "so_summary"
    t.text     "description"
    t.integer  "staff_responsible_id"
    t.string   "venue_type"
    t.string   "venue_name"
    t.string   "venue_address"
    t.string   "venue_state"
    t.text     "venue_notes"
    t.datetime "access_time"
    t.datetime "guest_arrival_time"
    t.datetime "sound_check_time"
    t.string   "stage_size"
    t.string   "number_of_guests"
    t.text     "load_in_directions"
    t.string   "contact_person_on_day"
    t.string   "contact_mobile_on_day"
    t.string   "customer_email"
    t.string   "customer_phone"
    t.string   "event_type"
    t.string   "event_type_other"
    t.string   "venue_type_other"
    t.string   "customer_salutation"
    t.string   "customer_address"
    t.string   "customer_company_name"
    t.string   "customer_company_abn"
    t.string   "customer_mobile"
    t.string   "callout_duration"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "p_email"
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id", using: :btree

  create_table "rating_caches", force: :cascade do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree

  create_table "received_payments", force: :cascade do |t|
    t.integer  "booking_id"
    t.string   "description"
    t.decimal  "amount"
    t.datetime "payment_date"
    t.string   "payment_type"
    t.decimal  "payment_type_surcharge"
    t.datetime "deleted_at"
    t.integer  "reconciliation_id"
    t.string   "reciept_file_name"
    t.string   "reciept_content_type"
    t.integer  "reciept_file_size"
    t.datetime "reciept_updated_at"
  end

  add_index "received_payments", ["booking_id"], name: "index_received_payments_on_booking_id", using: :btree
  add_index "received_payments", ["reconciliation_id"], name: "index_received_payments_on_reconciliation_id", using: :btree

  create_table "reconciliations", force: :cascade do |t|
    t.money    "balance",    scale: 2
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "refunds", force: :cascade do |t|
    t.string   "description"
    t.text     "entoz_notes"
    t.datetime "due"
    t.decimal  "artist_ex_gst"
    t.decimal  "artist_gst"
    t.decimal  "ent_oz_exp_ex_gst"
    t.decimal  "ent_oz_exp_gst"
    t.decimal  "artist_exp_ex_gst"
    t.decimal  "artist_exp_gst"
    t.integer  "profile_order_id"
    t.integer  "booking_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.decimal  "commission_ex_gst"
    t.decimal  "commission_gst"
    t.decimal  "surcharge_ex_gst"
    t.decimal  "surcharge_gst"
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "title"
    t.text     "comment"
    t.integer  "artist_profile_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "contact_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "savings_transfers", force: :cascade do |t|
    t.integer  "direction"
    t.integer  "amount_cents",      default: 0, null: false
    t.integer  "user_id"
    t.integer  "reconciliation_id"
    t.integer  "aba_id"
    t.datetime "paid_at"
    t.datetime "due"
    t.string   "status"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "savings_transfers", ["aba_id"], name: "index_savings_transfers_on_aba_id", using: :btree
  add_index "savings_transfers", ["reconciliation_id"], name: "index_savings_transfers_on_reconciliation_id", using: :btree
  add_index "savings_transfers", ["user_id"], name: "index_savings_transfers_on_user_id", using: :btree

  create_table "service_options", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "profile_id"
    t.decimal  "price"
    t.boolean  "deleted"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "service_options", ["profile_id"], name: "index_service_options_on_profile_id", using: :btree

  create_table "service_orders", force: :cascade do |t|
    t.integer  "service_option_id"
    t.text     "description"
    t.datetime "service_start"
    t.string   "total_performance_duration"
    t.string   "so_summary"
    t.text     "so_description"
    t.integer  "customer_price"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "profile_order_id"
    t.decimal  "artist_fee"
    t.boolean  "fee_inc_gst"
    t.boolean  "price_inc_gst"
    t.decimal  "total_customer_price"
    t.decimal  "total_artist_fee"
    t.string   "callout_duration"
    t.datetime "service_end"
    t.decimal  "new_artist_fee_cents"
    t.decimal  "gross_commission_percent"
    t.boolean  "apply_rounding"
    t.decimal  "artist_fee_rounded"
    t.boolean  "accommodation_req"
    t.boolean  "travel_req"
    t.boolean  "ground_transfers_req"
    t.boolean  "meals_req"
    t.boolean  "artist_equipment_req"
    t.boolean  "artist_equipment_conf"
    t.boolean  "meals_conf"
    t.boolean  "ground_transfers_conf"
    t.boolean  "travel_conf"
    t.boolean  "accommodation_conf"
    t.string   "event_type"
    t.string   "number_of_guests"
    t.text     "contact_person_on_day"
    t.text     "contact_mobile_on_day"
    t.string   "venue_type"
    t.string   "venue_name"
    t.text     "venue_address"
    t.text     "venue_notes"
    t.string   "event_type_other"
    t.string   "venue_type_other"
    t.datetime "access_time"
    t.datetime "guest_arrival_time"
    t.datetime "sound_check_time"
    t.string   "stage_size"
    t.text     "load_in_directions"
    t.text     "access_time_note"
    t.text     "guest_arrival_time_note"
    t.text     "sound_check_time_note"
  end

  add_index "service_orders", ["profile_order_id"], name: "index_service_orders_on_profile_order_id", using: :btree
  add_index "service_orders", ["service_option_id"], name: "index_service_orders_on_service_option_id", using: :btree

  create_table "social_media_links", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "testimonials", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "testimonial_image_file_name"
    t.string   "testimonial_image_content_type"
    t.integer  "testimonial_image_file_size"
    t.datetime "testimonial_image_updated_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "transfer_groups", force: :cascade do |t|
    t.decimal  "amount_ex_gst"
    t.decimal  "gst"
    t.datetime "paid_at"
    t.datetime "reconciliation"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "transfers", force: :cascade do |t|
    t.datetime "due"
    t.string   "status"
    t.integer  "booking_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.datetime "blocked_date"
    t.decimal  "surcharge_ex_gst"
    t.decimal  "surcharge_gst"
    t.decimal  "artist_ex_gst"
    t.decimal  "artist_gst"
    t.decimal  "artist_exp_ex_gst"
    t.decimal  "artist_exp_gst"
    t.decimal  "ent_oz_exp_ex_gst"
    t.decimal  "ent_oz_exp_gst"
    t.decimal  "commission_ex_gst"
    t.decimal  "commission_gst"
    t.integer  "aba_id"
    t.datetime "paid_at"
    t.integer  "reconciliation_id"
    t.integer  "profile_order_id"
  end

  add_index "transfers", ["reconciliation_id"], name: "index_transfers_on_reconciliation_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.string   "surname"
    t.string   "firstname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  add_foreign_key "abas", "transfer_groups"
  add_foreign_key "bookings", "customers"
  add_foreign_key "customers", "users"
  add_foreign_key "expenses", "bookings"
  add_foreign_key "expenses", "profile_orders"
  add_foreign_key "invoice_payments", "bookings"
  add_foreign_key "issues", "issue_milestones"
  add_foreign_key "issues", "users"
  add_foreign_key "items", "users"
  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
  add_foreign_key "profile_orders", "bookings"
  add_foreign_key "profile_orders", "profiles"
  add_foreign_key "profile_payments", "profile_orders"
  add_foreign_key "profiles", "users"
  add_foreign_key "received_payments", "bookings"
  add_foreign_key "savings_transfers", "abas"
  add_foreign_key "savings_transfers", "users"
  add_foreign_key "service_options", "profiles"
  add_foreign_key "service_orders", "profile_orders"
  add_foreign_key "service_orders", "service_options"
  add_foreign_key "users", "roles"
end
