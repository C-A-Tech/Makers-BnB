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
      flash[:notice] = 'Invalid email or password'
      redirect('/login')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

  run! if app_file == $PROGRAM_NAME
end