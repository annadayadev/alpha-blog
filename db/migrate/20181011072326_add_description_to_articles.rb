class AddDescriptionToArticles < ActiveRecord::Migration
  def change
    
  # this is our first way of adding description, but we have a better one, once the tables are created.
    # t.text :description
    
  # these columns will now be added to the table
  
#   	add_column (you can specify what your doing) 
# 		1 - you want to give it a table name
# 		2 - attribute name
# 		3 - the type of the attribute
# 	articles table, the name of the attribute: description, and text: the type and one more thing to add is timestamps - normally are added to table simply by t.timestamp.
  
    add_column :articles, :description, :text
  	add_column :articles, :created_at, :datetime
	  add_column :articles, :updated_at, :datetime
      
      
  end
end
