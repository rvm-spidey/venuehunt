class ChangeOpeningandclosingtime < ActiveRecord::Migration[7.0]
  def change
    change_column :venues, :opening_time, :time
    change_column :venues, :closing_time, :time
  end
end
