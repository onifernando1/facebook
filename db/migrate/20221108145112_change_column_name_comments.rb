class ChangeColumnNameComments < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :post_author_id, :post_id
  end
end
