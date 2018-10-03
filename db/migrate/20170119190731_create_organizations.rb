# frozen_string_literal: true

class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.timestamps
      t.integer :organization_id
      t.string :email
      t.integer :status, default: 0
      t.string :description
      t.integer :type, default: 0
    end
  end
end
