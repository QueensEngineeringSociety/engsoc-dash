# frozen_string_literal: true

class DropOrganizationsUsers < ActiveRecord::Migration[5.0]
  def change
    drop_table :organizations_users
  end
end
