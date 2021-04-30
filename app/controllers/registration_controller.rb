# frozen_string_literal: true

class BDE < Sinatra::Base
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
    session[:user_id] = user.id
    #added by jess to populate profile page.
    #seemed quicker than making a retrieve method.
    session[:user] = user
    @first_name = params[:first_name]
    redirect '/home'
  end
  # added by jess, fri 12.17
  get '/profile' do
    @b = Booking.retrieve(session[:user_id])
    
    erb :user_profile
  end
  # added by jess, fri 12.17

  run! if app_file == $PROGRAM_NAME
end
