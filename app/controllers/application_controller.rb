# frozen_string_literal: true

class BDE < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :sessions
    set :root, File.dirname(File.expand_path('..', __FILE__))
    set :public_folder, Proc.new { File.join(root, '../public') }
  end
end
