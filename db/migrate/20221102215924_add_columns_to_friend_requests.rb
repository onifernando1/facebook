class AddColumnsToFriendRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :friend_requests, :sent_to_id, :integer
    add_column :friend_requests, :sent_from_id, :integer

  end
end
