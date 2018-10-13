class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      
  # we added this for the title
    t.string :title
    
  # this is our first way of adding description, but we have a better one, once the tables are created.
    # t.text :description
    
  
    end
  end
end
