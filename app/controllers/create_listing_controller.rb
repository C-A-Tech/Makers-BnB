# frozen_string_literal: true

class BDE < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions
  get '/space/new' do
    erb :new_space
  end

  post '/space' do
    @Available = [
      params[:Monday],
      params[:Tuesday],
      params[:Wednesday],
      params[:Thursday],
      params[:Friday],
      params[:Saturday],
      params[:Sunday]
    ]

    Space.create(
      title: params[:Title],
      description: params[:Description],
      price: params[:Price],
      location: params[:Location],
      availability: @Available,
      user_id: session[:user_id]
    )

    redirect('/home')
  end

  run! if app_file == $PROGRAM_NAME
end
