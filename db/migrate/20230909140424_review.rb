class Review < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :venue, foreign_key: true
    add_reference :reviews, :booking, foreign_key: true
  end
end
