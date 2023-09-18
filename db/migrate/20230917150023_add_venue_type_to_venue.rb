class AddVenueTypeToVenue < ActiveRecord::Migration[7.0]
  def change
    add_reference :venues, :venuetype, foreign_key: true
  end
end
