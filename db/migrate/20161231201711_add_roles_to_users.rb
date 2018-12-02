# frozen_string_literal: true

class AddRolesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :superadmin_role, :boolean, default: false
    add_column :users, :admin_role, :boolean, default: false
    add_column :users, :management_role, :boolean, default: false
    add_column :users, :student_role, :boolean, default: true
  end
end
