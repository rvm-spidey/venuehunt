class AddAdminFieldChatroom < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :admin, foreign_key: { to_table: :users }
  end
end
