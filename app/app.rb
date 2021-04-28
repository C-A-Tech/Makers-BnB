# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'

require_relative 'controllers/registration_controller'
require_relative 'controllers/create_listing_controller'
require_relative 'controllers/application_controller'
require './lib/user'
require './lib/space'

