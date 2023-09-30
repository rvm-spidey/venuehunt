class AddShowVenueOnHomePage < ActiveRecord::Migration[7.0]
  def change
    add_column :venues, :show_on_homepage, :boolean
  end
end
