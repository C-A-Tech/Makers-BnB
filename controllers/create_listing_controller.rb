require './lib/space.rb'

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
    
    Space.create(title: params[:Title],description: params[:Description],price: params[:Price],location: params[:Location],availability: @Available)
    
    redirect('/home')
  end

  get '/home' do
    @spaces = Space.all
    erb :home
  end  

  run! if app_file == $0
end
