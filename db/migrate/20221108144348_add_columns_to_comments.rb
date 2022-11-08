class AddColumnsToComments < ActiveRecord::Migration[7.0]
  def change

      add_column :comments, :commenter_id, :integer
      add_column :comments, :post_author_id, :integer
      add_column :comments, :information, :string 

  end
end
