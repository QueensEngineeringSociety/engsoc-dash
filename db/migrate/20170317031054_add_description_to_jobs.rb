# frozen_string_literal: true

class AddDescriptionToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :description, :text
    add_column :jobs, :status, :integer
    add_column :jobs, :role, :integer
  end
end
