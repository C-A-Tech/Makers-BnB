# frozen_string_literal: true

class BDE < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :sessions
    set :root, File.dirname(File.expand_path(__dir__))
    set :public_folder, proc { File.join(root, '../public') }
  end
end
