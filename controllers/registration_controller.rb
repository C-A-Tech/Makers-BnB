# frozen_string_literal: true

class BDE < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/user/new' do
    erb :signup
  end

  post '/users' do
    @name = params[:name]
    @email = params[:email]
    @password = params[:password]
    "you posted a new user! hi #{@name} :)"
    # redirect '/home'
  end

  run! if app_file == $PROGRAM_NAME
end
