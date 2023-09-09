class CreateVenues < ActiveRecord::Migration[7.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.text :description
      t.integer :space_size
      t.datetime :opening_time
      t.datetime :closing_time
      t.boolean :availability
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :price
      t.boolean :food_beverages_offered
      t.boolean :other_services_offered

      t.timestamps
    end
  end
end
