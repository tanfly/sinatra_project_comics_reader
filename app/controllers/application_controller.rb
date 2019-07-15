require './config/environment'
require 'rack-flash'
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions 
  set :session_secret, "9406069"
  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    erb :index 
  end

  helpers do 

    def clear 
      self.all.clear 
    end
    
    def logged_in?
      !!current_user
    end

    def current_user 
      @user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end

end
