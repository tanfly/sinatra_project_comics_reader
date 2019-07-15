class ComicsController < ApplicationController

  get '/comics' do
    if logged_in?
    @comics = Comic.all
    @user = current_user
    erb :'/comics/index'
    else
      flash[:error] = "You have to login for that."
      redirect '/login'
    end
  end

  post '/comics' do
    if params[:comic]
      @user = User.find(session[:user_id])
      @comic = Comic.find(params[:comic][:ids])
      @user.comics << @comic
      flash[:message] = 'Successfully updated your list!'
      redirect '/profile'
    else 
      flash[:error] = 'Please select at least one comic to add to your list.'
      redirect '/comics'
    end
  end

  get '/comics/new' do
    if logged_in?
    @authors = Author.all
    @illustrators = Illustrator.all
    erb :'/comics/new'
    else 
      redirect '/'
    end
  end

  post '/comics/new' do
    @user = current_user
    @comic = Comic.create(params["comic"])
    if !params[:author][:name].empty? 
      @comic.authors << Author.create(params[:author])
    end

    if !params[:illustrator][:name].empty?
      @comic.illustrators << Illustrator.create(params[:illustrator])
    end
    @comic.update_attributes(:user_created => @user.id)
    flash[:message] = "Successfully created comic!"
    redirect "/profile"
  end

  get '/comics/:id' do
    if logged_in?
    @comic = Comic.find(params[:id])
    @authors = @comic.authors
    @illustrators = @comic.illustrators
    erb :"comics/show"
    else 
      redirect '/'
    end
  end

  post '/comics/:id' do 
    if params[:comic]
      @user = User.find(session[:user_id])
      @comic = Comic.find(params[:comic][:ids])
      @user.comics << @comic
      flash[:message] = 'Successfully updated your list!'
      redirect '/profile'
    end
  end

  get '/comics/:id/edit' do
    if logged_in?
    @comic = Comic.find(params[:id])
    @authors = Author.all
    @illustrators = Illustrator.all
    erb :"comics/edit"
    else 
      redirect '/'
    end
  end

  patch '/comics/:id' do
    @comic = Comic.find(params[:id])
    @comic.update(params[:comic])

    if !params[:author][:name].empty?
      @comic.authors << Author.find_or_create_by(name: params[:author][:name])
    end

    if !params[:illustrator][:name].empty?
      @comic.illustrators << Illustrator.find_or_create_by(name: params[:illustrator][:name])
    end
    @comic.save
    flash[:message] = "Successfully updated comic."
    redirect to "comics/#{@comic.id}"

  end

  delete '/comics/:id' do
    if logged_in?
      @comic = Comic.find(params[:id])
        if @comic.user_created == current_user.id
        @comic.destroy
        flash[:message] = "Successfully updated comic."
        redirect '/comics'
        else
        flash[:error] = 'You can only delete comics that you created'
        redirect '/comics'
        end
    else
      redirect '/'
    end
  end

end