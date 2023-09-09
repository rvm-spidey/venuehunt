class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :date_from
      t.date :date_to
      t.string :event_name
      t.integer :number_of_participants
      t.string :food
      t.string :beverage
      t.string :other_services_offered
      t.integer :total

      t.timestamps
    end
  end
end
