class AddColumnToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :information, :string 
  end
end
