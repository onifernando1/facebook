class ChangeColumnNameFriendship < ActiveRecord::Migration[7.0]
  def change
    rename_column :friendships, :friend1_id, :friend_one_id
    rename_column :friendships, :friend2_id, :friend_two_id

  end
end
