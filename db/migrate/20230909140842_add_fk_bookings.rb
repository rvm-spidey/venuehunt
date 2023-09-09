class AddFkBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :venue, foreign_key: true
    add_reference :bookings, :cart, foreign_key: true
  end
end
