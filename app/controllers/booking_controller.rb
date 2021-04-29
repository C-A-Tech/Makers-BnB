# frozen_string_literal: true

class BDE < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions

  post '/booking' do
    'welcome to the confirmation page'
    session[:space_id]    = params[:space_id]
    session[:title]       = params[:title]
    session[:price]       = params[:price]
    session[:description] = params[:description]
    redirect('booking/new')
  end

  get '/booking/new' do
    erb(:my_booking)
  end

  post '/booking/confirmation' do
    $booking = Booking.create(
      space_id: session[:space_id],
      user_id: session[:user_id],
      starting_date: params[:starting_date],
      ending_date: params[:ending_date]
    )
    redirect('/booking/confirmed')
  end

  get '/booking/confirmed' do
    @title         = session[:title]
    @description   = session[:description]
    @price         = session[:price]
    @starting_date = $booking.starting_date
    @ending_date   = $booking.ending_date

    erb(:confirmed)
  end

  run! if app_file == $PROGRAM_NAME
end