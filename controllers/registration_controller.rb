class BDE < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/user/new' do
    'hello :)'
    erb :signup
  end

  post '/users' do
    @name = params[:name]
    @email = params[:email]
    @password = params[:password]
    'you posted a new user! hi new user :)'
  end

  run! if app_file == $0
end
