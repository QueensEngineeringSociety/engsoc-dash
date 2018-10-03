# frozen_string_literal: true

class AddOrganizationUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations_users do |t|
      t.belongs_to :organization, index: true
      t.belongs_to :user, index: true
    end
  end
end
