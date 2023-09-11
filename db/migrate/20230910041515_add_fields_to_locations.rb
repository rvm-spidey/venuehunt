class AddFieldsToLocations < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :outline, :text
    add_column :locations, :description, :text
  end
end
