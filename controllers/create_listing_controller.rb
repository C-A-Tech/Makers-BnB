class BDE < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/create-listing' do
    erb(:create_listing)
  end

  run! if app_file == $0
end