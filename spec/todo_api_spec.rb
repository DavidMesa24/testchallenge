require 'spec_helper'
RSpec.describe DriversController, type: :controller do

  def app
    Sinatra::Application
  end
  describe 'GET /v1/drivers' do
    it 'returns http success' do
      get '/v1/drivers'
      expect(last_response.status).to be(200)
    end
  end

  describe 'GET /v1/drivers/1' do
    it 'returns http success' do
      get '/v1/drivers/1'
      expect(last_response.status).to be(200)
    end
  end

  describe 'GET /v1/riders' do
    it 'returns http success' do
      get '/v1/riders'
      expect(last_response.status).to be(200)
    end
  end

  describe 'GET /v1/riders/1' do
    it 'returns http success' do
      get '/v1/riders/1'
      expect(last_response.status).to be(200)
    end
  end

  describe 'GET /v1/riders/1/request_ride' do
    before do
      it 'returns http success' do
        get 'v1/riders/1/request_ride'
        expect(last_response.status).to be(200)
      end
      after do
        get '/v1/drivers/1/finish_ride'
      end
    end
  end


  describe 'GET /v1/drivers/1/finish_ride' do
    it 'returns http success' do
      get '/v1/drivers/1/finish_ride'
      expect(last_response.status).to be(200)
    end
  end

  describe 'Ryder', type: :model do
    before do
      it 'can request a ride' do
        rider = Rider.create(rider)
        ride = rider.request_ride(2)
        expect(ride).to eq(Ride.last)
      end
      after do
        it 'can finish a ride' do
          driver = Driver.find(ride.driver_id)
          driver.finish_ride(ride.id)
        end
      end
    end
  end
end
