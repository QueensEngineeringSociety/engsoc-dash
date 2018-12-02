# frozen_string_literal: true

class CreateJobsAndUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs_users do |t|
      t.belongs_to :job, index: true
      t.belongs_to :user, index: true
    end
  end
end
