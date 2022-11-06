class RemovePostLikeTable < ActiveRecord::Migration[7.0]
  def change

      drop_table :PostLike
  end
end
