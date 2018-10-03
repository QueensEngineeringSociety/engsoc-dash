# frozen_string_literal: true

class AddTypeToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :type, :integer, default: 0
  end
end
