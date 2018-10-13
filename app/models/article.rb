
class Article < ActiveRecord::Base
    
  #validation to ensure we will be saving complete data on our database.
  
  #before the object that i create hits the database, it will ensure that there will be a title, desc or otherwise it will not save. 
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
    
end


# how do we test if our table is generated? using the magic of rails, just because we have created this model. Rails now gives us getters and setters for the tables, for each attributes of the table. And we can fill them in from the console itself. 

# Rails Console - type : rails console
# So the console basically, gives you direct access to your database and you can basically treat this us a playground where you can test out things like database connection, you can test our methods, you can do anything. 

# Let's first test our connection to our article table -- Article.all