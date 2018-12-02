# frozen_string_literal: true

class AddStartDateAndEndDateToPositions < ActiveRecord::Migration[5.0]
  def change
    add_column :positions, :start_date, :datetime
    add_column :positions, :end_date, :datetime
  end
end
