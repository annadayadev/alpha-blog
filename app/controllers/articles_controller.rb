

# remember, className should be firstLetter Upperclass - Articles
# < means subclass of, so ArticlesController as subclass of ApplicationController
class ArticlesController < ApplicationController
    
#we know that this is going to have a new action because its looking for a new articles route.

# this wwill be our index, which will show the list of all our aricles

    def index
        @articles = Article.all
        
    end 

#creating new article    
    def new
        
        @article = Article.new
        
    end

#editing article    
    def edit
        
    #let's first find the article that we need to edit
    @article = Article.find(params[:id])
    
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
    
    
    
# we got an error: Unknown action after pressing the button edit, so we have to create our action button for update/edit
    def update 
        #first we have to create this article instance variable
        @article = Article.find(params[:id])
        
        #and same as create we have to add a conditional statement:if the new data passess our validations. but instead of save we'll say update.
        
        # we got an error saying wrong number arguments because we didn't passed in anything, if article.update, then update of what? so we're going to reuse this article_params method to whitelist whatever is submitted -- look again with our code for new, you would see that it is very similar. 
        if @article.update(article_params)
            flash[:notice] = "Article was successfully updated"
            redirect_to article_path(@article)
            
        else 
            #if there's an instance that doesn't passed the validation then we want them to redirected on the same page which is the edit page.
            render 'edit'
        
         end
    end
    
    
    
    
# this is the action to show the pages of the blogs created using ids

#show article page
    def show
        @article = Article.find(params[:id])
        
    end
    
        def destroy
        
        #targeting the specific article
        @article = Article.find(params[:id])
        
        # to delete
        @article.destroy
        
        #message/notificationt that it was deleted
        flash[:notice] = "Article was successfully deleted"
        
        #redirect to this page once deleted
        redirect_to articles_path
        
    end
    
    
        private
        	def article_params
        	
      #params.require toplevel key article, then we want to permit the keys article, the values of title, desc, so that is the article params
        	params.require(:article).permit(:title, :description)
        
    end
    

end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    