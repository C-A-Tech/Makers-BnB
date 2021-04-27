class BDE < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions
  get '/create-listing' do
    erb :new_listing
  end

  post '/spaces/new' do
    @Available = [params[:Monday], params[:Tuesday], params[:Wednesday], params[:Thursday], params[:Friday], params[:Saturday], params[:Sunday]]
    
    Spaces.create(params[:Title], params[:Description], params[:Price], params[:Location], @Available)
    redirect('/home')
  end

  get '/home' do
    # @Title = session[:Title] 
    # @Description = session[:Description] 
    # @Location = session[:Location]
    # @Price = session[:Price]
    # @Available = session[:Available]
    Spaces.all
    erb :home
  end  

  run! if app_file == $0
end