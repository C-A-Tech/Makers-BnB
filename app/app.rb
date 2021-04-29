# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'

require_relative 'controllers/registration_controller'
require_relative 'controllers/create_listing_controller'
require_relative 'controllers/application_controller'
require_relative 'controllers/booking_controller'
require_relative './lib/user'
require_relative './lib/space'
require_relative './lib/booking'
require_relative './lib/db_connection'
