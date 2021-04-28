# frozen_string_literal: true

require './lib/space.rb'

class BDE < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions

  post '/booking' do
    'welcome to the confirmation page'
    p 'HERE'
    p params
    p 'HERE'
    redirect('booking/new')
  end


  run! if app_file == $PROGRAM_NAME
end
