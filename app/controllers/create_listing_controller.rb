# frozen_string_literal: true

class BDE < Sinatra::Base
  get '/space/new' do
    erb :new_space
  end

  post '/space' do
    p params[:img]
    user = Space.create(
      title: params[:title],
      description: params[:description],
      price: params[:price],
      image: params[:img],
      available_from: params[:available_from],
      available_to: params[:available_to],
      user_id: session[:user_id]
    )

    redirect('/home')
  end

  get '/home' do
    @spaces = Space.all
    @user = session[:user_id]
    erb :home
  end
end
