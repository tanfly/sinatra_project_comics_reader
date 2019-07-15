require 'rack-flash'
class UsersController < ApplicationController
    use Rack::Flash

    get '/signup' do 
        if logged_in?
            redirect '/profile'
        else
            erb :'users/signup'
        end
    end

    post '/signup' do 
        if !params[:username].empty? && !params[:email].empty? && !params[:password].empty
            @user = User.create(params)
            @user.save
            session[:user_id] = @user.id  
            redirect '/profile'
        else 
            flash[:error] = 'Please ensure all areas are filled out.'
            redirect '/signup'
        end
    end


    get '/login' do 
        if logged_in?
            redirect '/profile'
        else 
            erb :'users/login' 
        end
    end

    post '/login' do 
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect '/profile'
        else
            redirect '/signup'
        end
    end

    get '/logout' do 
        if logged_in?
            session.clear 
            redirect '/login'
        else
            redirect '/login'
        end
    end

    get '/profile' do 
        @user = User.find(session[:user_id])
        @comics = @user.comics.uniq.sort
        erb :'users/show'
    end

    get '/delete_reading_list' do 
        @user = User.find(session[:user_id])
        @comics = @user.comics.uniq.sort
        erb :'/users/delete_reading_list'
    end

    post '/delete_reading_list' do
        if !params[:comic][:ids].empty?
            @user = User.find(session[:user_id])
            @comic = Comic.find(params[:comic][:ids])
            @user.comics.delete(@comic)
            redirect '/profile'
        end
    end

end