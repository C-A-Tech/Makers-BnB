# frozen_string_literal: true

class BDE < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/home' do
    @spaces = Space.all
    @user = session[:user_id]
    erb :home
  end
end
