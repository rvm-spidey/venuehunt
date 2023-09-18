class AddFieldsToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :phone_number, :string
    add_column :orders, :order_confirmation_email, :string
  end
end
