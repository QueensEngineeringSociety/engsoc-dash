# frozen_string_literal: true

class AddEmailNotificationsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :email_notifications, :boolean, default: true
  end
end
