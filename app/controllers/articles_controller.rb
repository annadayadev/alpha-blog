

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

# we unquote this because we still need to create article with the article params
     @article = Article.new(article_params)
     
        # @article.save
        # redirect_to article_path(@article)
        #redirect_to articles_show(@article) - and this is wrong, wrong path. 

#now we have to handle displaying this flash notice - so where do we display it? 
#basically all the views are wrapped within application.html.erb, basically all the views, this is a wrapper file. So anything we put in here will be displayed on every page, so we want our flash notice to be displayed here - views-layouts-applications.

# now what if validations happened here? When we dont put any data and just clicked create article, notice that it simply refreshes because of our condition - else new - but does not show any message about error. So in order to do that, we would want to check it here.


        if @article.save
            flash[:notice] = "Article was successfully created"
            redirect_to article_path(@article)
            
        else 
            render 'new' #validation not accepted, try again
            
        end    
    end
    
# this is the action to show the pages of the blogs created using ids
    def show
        @article = Article.find(params[:id])
        
    end
    
    
        private
        	def article_params
        	
      #params.require toplevel key article, then we want to permit the keys article, the values of title, desc, so that is the article params
        	params.require(:article).permit(:title, :description)
        
    end

end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    