# frozen_string_literal: true

class Changeforeignkeyforinterviews < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :interviews, :job_postings
    add_foreign_key :interviews, :job_applications
  end
end
