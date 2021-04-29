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
    # THIS PARAM DOESN'T EXIST YET BECAUSE OF MULTIPLE DAYS, OFF/ON setup.

    session[:day] = params[:day]
    session[:booking_id] = Booking.create(
      session[:space_id] = params[:id]
      session[:day].keys
    ).id
    redirect('/booking/confirmed')
  end

  get '/booking/confirmed' do
    @day = session[:day]
    erb(:confirmed)
  end


  run! if app_file == $PROGRAM_NAME
end
