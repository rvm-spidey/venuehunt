class ChangeCardNumberToString < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :card_number, :string
  end
end
