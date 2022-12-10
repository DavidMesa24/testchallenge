class RidersController < Sinatra::Base
  extend Geocoder::Model::ActiveRecord

  def self.index
    riders = Rider.all
    riders
  end

  def self.show(id)
    riders = Rider.find(id)
    riders
  end

  def self.token_card(id)
    rider = Rider.find(id)
    rider.token_card(id)
  end

  def self.payment_source(id)
    rider = Rider.find(id)
    rider.payment_source(id)
  end

  def self.request_ride(id)
    rider = Rider.find(id)
    rider.request_ride(id)
    ride = Ride.where(rider_id: rider.id).first
    ride
  end
end
