require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/activerecord'
require 'geocoder'
require 'httparty'
require 'json'

require_relative './app/controllers/drivers_controller'
require_relative './app/controllers/riders_controller'
require_relative './app/controllers/rides_controller'
require_relative './app/models/drivers_model'
require_relative './app/models/riders_model'
require_relative './app/models/payment_source'
require_relative './app/models/rides_model'
require_relative './app/models/transactions_model'


before do
  content_type :json
end

namespace '/v1' do
  get '/drivers' do
    drivers = DriversController.index
    drivers.to_json
  end

  get '/drivers/:id' do
    driver = DriversController.show(params[:id])
    driver.to_json
  end

  get '/riders' do
    riders = RidersController.index
    riders.to_json
  end

  get '/riders/:id' do
    rider = RidersController.show(params[:id])
    rider.to_json
  end
  get '/riders/:id/token-card' do
    rider = RidersController.token_card(params[:id])
    rider.to_json
  end

  get '/drivers/:id/token-card' do
    driver = DriversController.token_card(params[:id])
    driver.to_json
  end

  get '/riders/:id/payment_source' do
    rider = RidersController.payment_source(params[:id])
    rider.to_json
  end

  get '/riders/:id/request_ride' do
    ride = RidersController.request_ride(params[:id])
    ride.to_json
  end

  get '/drivers/:id/finish_ride' do
    ride = DriversController.finish_ride(params[:id])
    ride.to_json
  end
end
