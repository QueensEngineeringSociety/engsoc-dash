# frozen_string_literal: true

class ChangeColumnNameInOrgs < ActiveRecord::Migration[5.0]
  def change
    rename_column :organizations, :type, :department
  end
end
