ENV['SINATRA_ACTIVESUPPORT_WARNING'] = false

require './app'
require 'sinatra'

require_relative './app/controllers/drivers_controller'
require_relative './app/controllers/riders_controller'

use DriversController
use RidersController