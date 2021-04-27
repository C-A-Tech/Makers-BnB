class BDE < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions
  get '/create-listing' do
    erb :new_listing
  end

  post '/spaces/new' do
    session[:Title] = params[:Title]
    session[:Description]  = params[:Description]
    session[:Location] = params[:Location]
    session[:Price]  = params[:Price]
    session[:Available]  = [params[:Monday], params[:Tuesday], params[:Wednesday], params[:Thursday], params[:Friday], params[:Saturday], params[:Sunday]]
    redirect('/home')
  end

  get '/home' do
    @Title = session[:Title] 
    @Description = session[:Description] 
    @Location = session[:Location]
    @Price = session[:Price]
    @Available = session[:Available]
    erb :home
  end  

  run! if app_file == $0
end