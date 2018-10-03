# frozen_string_literal: true

class AddTitleToJobPosting < ActiveRecord::Migration[5.0]
  def change
    add_column :job_postings, :title, :string
  end
end
