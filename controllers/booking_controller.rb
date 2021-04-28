# frozen_string_literal: true

require './lib/space.rb'

class BDE < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions

  post '/booking' do
    'welcome to the confirmation page'
    session[:id] = params[:id]
    session[:title] = params[:title]
    session[:price] = params[:price]
    session[:description] = params[:description]
    redirect('booking/new')
  end

  get '/booking/new' do
    erb(:my_booking)
  end

  post '/booking/confirmation' do
    session[:day] = params[:day]
    redirect('/booking/confirmed')
  end

  get '/booking/confirmed' do
    @day = session[:day]
    erb(:confirmed)
  end


  run! if app_file == $PROGRAM_NAME
end
