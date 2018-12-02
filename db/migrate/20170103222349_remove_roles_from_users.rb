# frozen_string_literal: true

class RemoveRolesFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :student_role
    remove_column :users, :management_role
    remove_column :users, :admin_role
    remove_column :users, :superadmin_role
    add_column :users, :role, :integer, default: 0
  end
end
