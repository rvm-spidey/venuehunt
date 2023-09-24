class SetUsersIdToUserInVenue < ActiveRecord::Migration[7.0]
  def change
    rename_column :venues, :users_id, :user_id
  end
end
