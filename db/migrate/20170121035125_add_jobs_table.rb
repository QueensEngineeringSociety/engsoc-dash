# frozen_string_literal: true

class AddJobsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.belongs_to :user, index: true
      t.belongs_to :organization, index: true
      t.string :title
      t.timestamps
    end
  end
end
