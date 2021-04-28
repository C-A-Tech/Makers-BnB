# frozen_string_literal: true

class BDE < Sinatra::Base
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
    @name = params[:name]
    @email = params[:email]
    @password = params[:password]
    redirect '/home'
  end

  run! if app_file == $PROGRAM_NAME
end
