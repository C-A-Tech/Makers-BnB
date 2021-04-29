# frozen_string_literal: true

class BDE < Sinatra::Base
  get '/space/new' do
    erb :new_space
  end

  post '/space' do
    @available = [
      params[:monday],
      params[:tuesday],
      params[:wednesday],
      params[:thursday],
      params[:friday],
      params[:saturday],
      params[:sunday]
    ]

    Space.create(
      title: params[:title],
      description: params[:description],
      price: params[:price],
      location: params[:location],
      availability: @available,
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
