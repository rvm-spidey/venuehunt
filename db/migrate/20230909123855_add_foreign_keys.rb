class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_reference :venues, :location, foreign_key: true
    add_reference :venues, :user, foreign_key: true
  end
end
