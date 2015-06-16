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

ActiveRecord::Schema.define(version: 20_150_415_031_051) do
  create_table 'bookmarks', force: :cascade do |t|
    t.string 'url'
    t.integer 'topic_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id'
    t.string 'slug'
  end

  add_index 'bookmarks', ['slug'], name: 'index_bookmarks_on_slug'
  add_index 'bookmarks', ['topic_id'], name: 'index_bookmarks_on_topic_id'

  create_table 'friendly_id_slugs', force: :cascade do |t|
    t.string 'slug',                      null: false
    t.integer 'sluggable_id',              null: false
    t.string 'sluggable_type', limit: 50
    t.string 'scope'
    t.datetime 'created_at'
  end

  add_index 'friendly_id_slugs', %w(slug sluggable_type scope), name: 'index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope', unique: true
  add_index 'friendly_id_slugs', %w(slug sluggable_type), name: 'index_friendly_id_slugs_on_slug_and_sluggable_type'
  add_index 'friendly_id_slugs', ['sluggable_id'], name: 'index_friendly_id_slugs_on_sluggable_id'
  add_index 'friendly_id_slugs', ['sluggable_type'], name: 'index_friendly_id_slugs_on_sluggable_type'

  create_table 'likes', force: :cascade do |t|
    t.integer 'bookmark_id'
    t.integer 'user_id'
    t.datetime 'created_at',  null: false
    t.datetime 'updated_at',  null: false
  end

  add_index 'likes', ['bookmark_id'], name: 'index_likes_on_bookmark_id'
  add_index 'likes', ['user_id'], name: 'index_likes_on_user_id'

  create_table 'topics', force: :cascade do |t|
    t.string 'title'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'slug'
  end

  add_index 'topics', ['slug'], name: 'index_topics_on_slug'
  add_index 'topics', ['user_id'], name: 'index_topics_on_user_id'

  create_table 'users', force: :cascade do |t|
    t.string 'email',                  default: '',    null: false
    t.string 'encrypted_password',     default: ''
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count',          default: 0,     null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.string 'name'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.integer 'role'
    t.string 'invitation_token'
    t.datetime 'invitation_created_at'
    t.datetime 'invitation_sent_at'
    t.datetime 'invitation_accepted_at'
    t.integer 'invitation_limit'
    t.integer 'invited_by_id'
    t.string 'invited_by_type'
    t.integer 'invitations_count',      default: 0
    t.boolean 'public',                 default: false
  end

  add_index 'users', ['email'], name: 'index_users_on_email', unique: true
  add_index 'users', ['invitation_token'], name: 'index_users_on_invitation_token', unique: true
  add_index 'users', ['invitations_count'], name: 'index_users_on_invitations_count'
  add_index 'users', ['invited_by_id'], name: 'index_users_on_invited_by_id'
  add_index 'users', ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
end
