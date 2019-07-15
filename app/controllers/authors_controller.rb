class AuthorsController < ApplicationController
   
    get '/authors' do
      if logged_in?
      @authors = Author.all.sort
      erb :'/authors/index'
      else 
        flash[:error] = "You have to login for that."
        redirect '/login'
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
end