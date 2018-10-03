# frozen_string_literal: true

class AddAdditionalFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :gender, :integer, default: 0
    add_column :users, :birthday, :datetime
    add_column :users, :faculty, :text
    add_column :users, :specialization, :text
    add_column :users, :tagline, :text
    add_column :users, :bio, :text
  end
end
