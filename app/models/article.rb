
class Article < ActiveRecord::Base
    
  # then we go back to the article model — the user is singular since the article is the many side of the one to many association
    belongs_to :user
  
    
  #validation to ensure we will be saving complete data on our database.
  
  #before the object that i create hits the database, it will ensure that there will be a title, desc or otherwise it will not save. 
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  
#Now, one thing we’re going to add, is that we want to ensure that all of the articles will have a user, otherwise we wont able to save the article. So we wont have scenario that the userid is nil. So inorder to enforce that we will add another validation.

#this means that anytime an article is being created, user id should be present

  validates :user_id, presence: true
  
    
end


# how do we test if our table is generated? using the magic of rails, just because we have created this model. Rails now gives us getters and setters for the tables, for each attributes of the table. And we can fill them in from the console itself. 

# Rails Console - type : rails console
# So the console basically, gives you direct access to your database and you can basically treat this us a playground where you can test out things like database connection, you can test our methods, you can do anything. 

# Let's first test our connection to our article table -- Article.all


#