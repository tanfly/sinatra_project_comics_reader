class AuthorsController < ApplicationController
   
    get '/authors' do
      if logged_in?
      @authors = Author.all.sort
      erb :'/authors/index'
      else 
        redirect '/'
      end
    end
  
     get '/authors/:id' do
      if logged_in?
      @author = Author.find(params[:id])
      erb :'/authors/show'
      else 
        redirect '/'
      end
    end

    delete '/authors/:id' do 
      if logged_in?
        @author = Author.find(params[:id])
          @author.delete
      end
      redirect '/authors'
    end
end