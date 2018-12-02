# frozen_string_literal: true

class AddUserToResumes < ActiveRecord::Migration[5.0]
  def change
    add_reference :resumes, :user, foreign_key: true
  end
end
