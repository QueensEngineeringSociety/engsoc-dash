# frozen_string_literal: true

class ChangeRoleDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default :jobs, :role, 0
  end
end
