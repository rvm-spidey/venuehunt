class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :email_address
      t.integer :card_number
      t.date :exp_date
      t.integer :cvc
      t.integer :total
      t.timestamps
    end
  end
end
