class AddColumnstoPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :information, :string
    add_column :posts, :author_id, :integer
    
  end
end
