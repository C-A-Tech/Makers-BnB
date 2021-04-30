class BDE < Sinatra::Base
  register Sinatra::Flash
  get '/' do
    erb :index
  end

  get '/login' do
    erb :login
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
  
    if user
      session[:user_id] = user.id
      redirect('/home')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/login')
    end
  end

  # post '/user' do
  #   user = User.create(
  #     first_name: params[:first_name],
  #     last_name:  params[:last_name],
  #     email:      params[:email],
  #     password:   params[:password]
  #   )
  #   session[:user_id] = user.id
  #   redirect '/home'
  # end

  run! if app_file == $PROGRAM_NAME
end