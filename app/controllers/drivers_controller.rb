# frozen_string_literal: true

# CLass drivers
class DriversController < Sinatra::Base
  extend Geocoder::Model::ActiveRecord
  def self.index
    drivers = Driver.all
    drivers
  end

  def self.show(id)
    driver = Driver.find(id)
    driver
  end


  def self.finish_ride(id)
    @driver = Driver.find(id)
    @driver.finish_ride(id)
  end

  def self.create_transaction(ride)
    ridep = Ride.find(ride)
    @driver.create_transaction(ridep)
  end
  end
