class AddUserIdToArticles < ActiveRecord::Migration
  def change
    
    # add_column : first item: table name + column name + and then the type
    add_column :articles, :user_id, :integer
    
  end
end
