class AddFieldsToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :title, :string
    add_column :reviews, :booking_purpose, :string
    add_reference :reviews, :user, foreign_key: true
  end
end
