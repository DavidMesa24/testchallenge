require 'sinatra'
require './app'

run Sinatra::Application

require_relative './app/controllers/drivers_controller'
require_relative './app/controllers/riders_controller'

use DriversController
use RidersController
