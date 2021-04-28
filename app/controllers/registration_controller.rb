# frozen_string_literal: true

class BDE < Sinatra::Base

  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/user/new' do
    erb :signup
  end

  post '/user' do
    user = User.create(
      first_name: params[:first_name], 
      last_name:  params[:last_name], 
      email:      params[:email],
      password:   params[:password]
    )
    # retrieve id of user and store it in a session
    session[:user_id] = user.id
    redirect '/home'
  end

  run! if app_file == $PROGRAM_NAME
end
