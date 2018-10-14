

# remember, className should be firstLetter Upperclass - Articles
# < means subclass of, so ArticlesController as subclass of ApplicationController
class ArticlesController < ApplicationController
    
    #we know that this is going to have a new action because its looking for a new articles route.
    
    def new
        
        @article = Article.new
        
    end
    
    def create
        
        #to display the passing data
        
        # render plain: params[:article].inspect

        @article = Article.new(article_params)
        @article.save
        
        end
        
        private
        	def article_params
        	
      #params.require toplevel key article, then we want to permit the keys article, the values of title, desc, so that is the article params
        	params.require(:article).permit(:title, :description)
        
    end

end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    