# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_171_028_175_738) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'interviews', force: :cascade do |t|
    t.integer  'job_application_id'
    t.datetime 'start_time'
    t.datetime 'end_time'
    t.datetime 'created_at',         null: false
    t.datetime 'updated_at',         null: false
    t.index ['job_application_id'], name: 'index_interviews_on_job_application_id', using: :btree
  end

  create_table 'job_applications', force: :cascade do |t|
    t.datetime 'created_at',                     null: false
    t.datetime 'updated_at',                     null: false
    t.integer  'user_id'
    t.integer  'job_posting_id'
    t.integer  'status',         default: 0
    t.boolean  'archived',       default: false
    t.integer  'resumes_id'
    t.index ['resumes_id'], name: 'index_job_applications_on_resumes_id', using: :btree
  end

  create_table 'job_posting_answers', force: :cascade do |t|
    t.text     'content'
    t.integer  'job_application_id'
    t.datetime 'created_at',               null: false
    t.datetime 'updated_at',               null: false
    t.integer  'job_posting_questions_id'
    t.index ['job_application_id'], name: 'index_job_posting_answers_on_job_application_id', using: :btree
    t.index ['job_posting_questions_id'], name: 'index_job_posting_answers_on_job_posting_questions_id', using: :btree
  end

  create_table 'job_posting_questions', force: :cascade do |t|
    t.integer  'job_posting_id'
    t.text     'content'
    t.datetime 'created_at',     null: false
    t.datetime 'updated_at',     null: false
    t.index ['job_posting_id'], name: 'index_job_posting_questions_on_job_posting_id', using: :btree
  end

  create_table 'job_postings', force: :cascade do |t|
    t.datetime 'created_at',              null: false
    t.datetime 'updated_at',              null: false
    t.integer  'status', default: 0
    t.string   'description'
    t.datetime 'deadline'
    t.integer  'creator_id'
    t.string   'title'
    t.integer  'job_id'
    t.datetime 'start_date'
    t.datetime 'end_date'
    t.index ['job_id'], name: 'index_job_postings_on_job_id', using: :btree
  end

  create_table 'jobs', force: :cascade do |t|
    t.integer  'organization_id'
    t.string   'title'
    t.datetime 'created_at',                  null: false
    t.datetime 'updated_at',                  null: false
    t.text     'description'
    t.integer  'status'
    t.integer  'role',            default: 0
    t.integer  'job_type',        default: 0
    t.integer  'job_posting_id'
    t.index ['job_posting_id'], name: 'index_jobs_on_job_posting_id', using: :btree
    t.index ['organization_id'], name: 'index_jobs_on_organization_id', using: :btree
  end

  create_table 'organizations', force: :cascade do |t|
    t.datetime 'created_at',              null: false
    t.datetime 'updated_at',              null: false
    t.string   'email'
    t.integer  'status', default: 0
    t.string   'description'
    t.integer  'department', default: 0
    t.string   'name'
  end

  create_table 'positions', force: :cascade do |t|
    t.integer  'job_id',     null: false
    t.integer  'user_id',    null: false
    t.datetime 'start_date'
    t.datetime 'end_date'
    t.index ['job_id'], name: 'index_positions_on_job_id', using: :btree
    t.index ['user_id'], name: 'index_positions_on_user_id', using: :btree
  end

  create_table 'resumes', force: :cascade do |t|
    t.string   'name'
    t.string   'attachment'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer  'user_id'
    t.index ['user_id'], name: 'index_resumes_on_user_id', using: :btree
  end

  create_table 'users', force: :cascade do |t|
    t.string   'first_name'
    t.string   'last_name'
    t.string   'phone_number'
    t.string   'email',                  default: '', null: false
    t.string   'encrypted_password',     default: ''
    t.string   'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer  'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.inet     'current_sign_in_ip'
    t.inet     'last_sign_in_ip'
    t.datetime 'created_at',                            null: false
    t.datetime 'updated_at',                            null: false
    t.integer  'role',                   default: 0
    t.boolean  'student',                default: true
    t.integer  'gender',                 default: 0
    t.datetime 'birthday'
    t.text     'faculty'
    t.text     'specialization'
    t.text     'tagline'
    t.text     'bio'
    t.string   'preferred_name'
    t.boolean  'email_notifications', default: true
    t.index ['email'], name: 'index_users_on_email', unique: true, using: :btree
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true, using: :btree
  end

  add_foreign_key 'interviews', 'job_applications'
  add_foreign_key 'job_applications', 'resumes', column: 'resumes_id'
  add_foreign_key 'job_posting_answers', 'job_applications'
  add_foreign_key 'job_posting_answers', 'job_posting_questions', column: 'job_posting_questions_id'
  add_foreign_key 'job_posting_questions', 'job_postings'
  add_foreign_key 'job_postings', 'jobs'
  add_foreign_key 'jobs', 'job_postings'
  add_foreign_key 'resumes', 'users'
end
