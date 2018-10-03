# frozen_string_literal: true

class AddStudentToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :student, :boolean, default: true
  end
end
