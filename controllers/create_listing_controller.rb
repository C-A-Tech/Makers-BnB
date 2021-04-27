class BDE < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/create-listing' do
    p "hi"
    erb :new_listing
  end

  post '/dummyHomePage' do

  end

  run! if app_file == $0
end