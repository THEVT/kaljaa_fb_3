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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140417073810) do

  create_table "abouts", :force => true do |t|
    t.text     "content"
    t.integer  "profile_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "abouts", ["profile_id", "updated_at"], :name => "index_abouts_on_profile_id_and_updated_at"

  create_table "accounts", :force => true do |t|
    t.string   "email"
    t.string   "authorization"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "enabled",         :default => 1
    t.string   "ty"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "accounts", ["email"], :name => "index_accounts_on_email", :unique => true
  add_index "accounts", ["remember_token"], :name => "index_accounts_on_remember_token"

  create_table "activities", :force => true do |t|
    t.text     "content"
    t.integer  "account_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "profile_id"
  end

  add_index "activities", ["created_at"], :name => "index_activities_on_account_id_and_created_at"
  add_index "activities", ["profile_id"], :name => "index_activities_on_profile_id"

  create_table "albums", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "profile_id"
    t.integer  "event_id"
    t.integer  "group_id"
    t.integer  "article_id"
    t.integer  "blog_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "profile_id"
    t.integer  "word_on_the_street"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "event_id"
    t.integer  "group_id"
  end

  add_index "articles", ["profile_id", "created_at"], :name => "index_articles_on_profile_id_and_created_at"

  create_table "beercentrals", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "beers", :force => true do |t|
    t.string   "brewery_name"
    t.string   "beer_name"
    t.text     "content"
    t.integer  "profile_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "beers", ["profile_id", "created_at"], :name => "index_beers_on_profile_id_and_created_at"

  create_table "beers_reviewbeers", :id => false, :force => true do |t|
    t.integer "beer_id",       :null => false
    t.integer "reviewbeer_id", :null => false
  end

  add_index "beers_reviewbeers", ["beer_id", "reviewbeer_id"], :name => "index_beers_reviewbeers_on_beer_id_and_reviewbeer_id", :unique => true

  create_table "blogs", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "profile_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "event_id"
    t.integer  "group_id"
  end

  add_index "blogs", ["profile_id", "created_at"], :name => "index_blogs_on_profile_id_and_created_at"

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "profile_id"
  end

  create_table "constants", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "conversations", :force => true do |t|
    t.string   "subject",    :default => ""
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "weekly"
    t.string   "day"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.string   "country"
    t.text     "description"
    t.integer  "exclusive"
    t.integer  "major_event"
    t.integer  "profile_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "events", ["profile_id", "created_at", "start_time"], :name => "index_events_on_profile_id_and_created_at_and_start_time"

  create_table "favbeers", :force => true do |t|
    t.string   "b1"
    t.string   "b2"
    t.string   "b3"
    t.string   "b4"
    t.string   "b5"
    t.string   "b6"
    t.string   "b7"
    t.string   "b8"
    t.string   "b9"
    t.string   "b10"
    t.integer  "profile_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "favbeers", ["profile_id", "updated_at"], :name => "index_favbeers_on_profile_id_and_updated_at"

  create_table "favbreweries", :force => true do |t|
    t.string   "b1"
    t.string   "b2"
    t.string   "b3"
    t.string   "b4"
    t.string   "b5"
    t.string   "b6"
    t.string   "b7"
    t.string   "b8"
    t.string   "b9"
    t.string   "b10"
    t.integer  "profile_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "favbreweries", ["profile_id", "updated_at"], :name => "index_favbreweries_on_profile_id_and_updated_at"

  create_table "friendships", :force => true do |t|
    t.string   "profile_id"
    t.string   "friend_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "status"
  end

  create_table "groups", :force => true do |t|
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "title"
    t.integer  "exclusive"
    t.integer  "visible"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.string   "country"
    t.text     "description"
    t.integer  "profile_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "honorablebeers", :force => true do |t|
    t.text     "content"
    t.integer  "profile_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "honorablebeers", ["profile_id", "updated_at"], :name => "index_honorablebeers_on_profile_id_and_updated_at"

  create_table "interests", :force => true do |t|
    t.text     "content"
    t.integer  "profile_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "interests", ["profile_id", "created_at"], :name => "index_interests_on_profile_id_and_created_at"

  create_table "invites", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "event_id"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "admin"
    t.integer  "creator"
  end

  add_index "invites", ["profile_id", "event_id"], :name => "index_invites_on_profile_id_and_event_id"

  create_table "locations", :force => true do |t|
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "profile_id"
  end

  add_index "locations", ["profile_id", "updated_at"], :name => "index_locations_on_profile_id_and_updated_at"

  create_table "members", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "group_id"
    t.string   "name"
    t.string   "status"
    t.integer  "admin"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "ignore"
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "account_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "microposts", ["account_id", "created_at"], :name => "index_microposts_on_account_id_and_created_at"

  create_table "miscs", :force => true do |t|
    t.text     "content"
    t.integer  "profile_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "miscs", ["profile_id", "updated_at"], :name => "index_miscs_on_profile_id_and_updated_at"

  create_table "notifications", :force => true do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              :default => ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                :default => false
    t.datetime "updated_at",                              :null => false
    t.datetime "created_at",                              :null => false
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "notification_code"
    t.string   "attachment"
    t.boolean  "global",               :default => false
    t.datetime "expires"
  end

  add_index "notifications", ["conversation_id"], :name => "index_notifications_on_conversation_id"

  create_table "photos", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "album_id"
    t.integer  "profile_pic"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.integer  "wall"
    t.integer  "ts"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.integer  "phone"
    t.string   "website"
    t.string   "email"
    t.string   "gender"
    t.string   "street"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "account_id"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.string   "profile_type"
    t.date     "birthday"
  end

  add_index "profiles", ["account_id", "created_at"], :name => "index_profiles_on_account_id_and_created_at"
  add_index "profiles", ["profile_type"], :name => "index_profiles_on_type"

  create_table "receipts", :force => true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                                  :null => false
    t.boolean  "is_read",                       :default => false
    t.boolean  "trashed",                       :default => false
    t.boolean  "deleted",                       :default => false
    t.string   "mailbox_type",    :limit => 25
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "receipts", ["notification_id"], :name => "index_receipts_on_notification_id"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "reviewbeers", :force => true do |t|
    t.string   "brewery_name"
    t.string   "beer_name"
    t.string   "grade"
    t.string   "beer_type"
    t.text     "content"
    t.integer  "smell"
    t.integer  "look"
    t.integer  "feel"
    t.integer  "taste"
    t.integer  "personal_brew"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "profile_id"
  end

  add_index "reviewbeers", ["profile_id", "created_at"], :name => "index_reviewbeers_on_profile_id_and_created_at"

  create_table "rs_evaluations", :force => true do |t|
    t.string   "reputation_name"
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "target_id"
    t.string   "target_type"
    t.float    "value",           :default => 0.0
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "rs_evaluations", ["reputation_name", "source_id", "source_type", "target_id", "target_type"], :name => "index_rs_evaluations_on_reputation_name_and_source_and_target", :unique => true
  add_index "rs_evaluations", ["reputation_name"], :name => "index_rs_evaluations_on_reputation_name"
  add_index "rs_evaluations", ["source_id", "source_type"], :name => "index_rs_evaluations_on_source_id_and_source_type"
  add_index "rs_evaluations", ["target_id", "target_type"], :name => "index_rs_evaluations_on_target_id_and_target_type"

  create_table "rs_reputation_messages", :force => true do |t|
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "receiver_id"
    t.float    "weight",      :default => 1.0
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "rs_reputation_messages", ["receiver_id", "sender_id", "sender_type"], :name => "index_rs_reputation_messages_on_receiver_id_and_sender", :unique => true
  add_index "rs_reputation_messages", ["receiver_id"], :name => "index_rs_reputation_messages_on_receiver_id"
  add_index "rs_reputation_messages", ["sender_id", "sender_type"], :name => "index_rs_reputation_messages_on_sender_id_and_sender_type"

  create_table "rs_reputations", :force => true do |t|
    t.string   "reputation_name"
    t.float    "value",           :default => 0.0
    t.string   "aggregated_by"
    t.integer  "target_id"
    t.string   "target_type"
    t.boolean  "active",          :default => true
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "rs_reputations", ["reputation_name", "target_id", "target_type"], :name => "index_rs_reputations_on_reputation_name_and_target", :unique => true
  add_index "rs_reputations", ["reputation_name"], :name => "index_rs_reputations_on_reputation_name"
  add_index "rs_reputations", ["target_id", "target_type"], :name => "index_rs_reputations_on_target_id_and_target_type"

  create_table "services", :force => true do |t|
    t.text     "content"
    t.integer  "profile_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "services", ["profile_id", "updated_at"], :name => "index_services_on_profile_id_and_updated_at"

  add_foreign_key "notifications", "conversations", name: "notifications_on_conversation_id"

  add_foreign_key "receipts", "notifications", name: "receipts_on_notification_id"

end
