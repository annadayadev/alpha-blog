class User < ActiveRecord::Base
    
    #validate the username
    #this line ensures that username is present, but we also want to enforce length validations so we include length
    validates :username, presence: true, 
               uniqueness: { case_sensitive: false },
               length: { minimum: 3, maximum: 25 }
    
    # rubular.com --- here you can test out your regular expression, and then put in a string if it matches that format. Regular expressions can be helpful, to do matches like this. If you like for example, matching search results, and you want to use regular expressions, you can do that. 
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :email, presence: true, length: { maximum: 105 },
    uniqueness: { case_sensitive: false },
    format: { with: VALID_EMAIL_REGEX }
    
end