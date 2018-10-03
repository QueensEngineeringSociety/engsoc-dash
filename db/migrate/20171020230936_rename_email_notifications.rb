# frozen_string_literal: true

class RenameEmailNotifications < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :email_notifications, :email_notifications
  end
end
