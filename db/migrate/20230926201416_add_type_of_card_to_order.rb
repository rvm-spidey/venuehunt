class AddTypeOfCardToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :card_type, :string
  end
end
