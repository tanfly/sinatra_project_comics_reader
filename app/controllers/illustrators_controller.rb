class IllustratorsController < ApplicationController
   
  get '/illustrators' do
    if logged_in?
    @illustrators = Illustrator.all.sort
    erb :'/illustrators/index'
    else 
      flash[:error] = "You have to login for that."
      redirect '/login'
    end
  end

   get '/illustrators/:id' do
    if logged_in?
    @illustrator = Illustrator.find(params[:id])
    erb :'/illustrators/show'
    else 
      redirect '/'
    end
  end
end
