require "spec_helper"
RSpec.describe DriversController, type: :controller do

  def app
    Sinatra::Application
  end
  describe "GET /v1/drivers" do
    it "returns http success" do
      get "/v1/drivers"
      expect(last_response.status).to be(200)
    end
  end

  describe "GET /v1/drivers/1" do
    it "returns http success" do
      get "/v1/drivers/1"
      expect(last_response.status).to be(200)
    end
  end

  describe "GET /v1/riders" do
    it "returns http success" do
      get "/v1/riders"
      expect(last_response.status).to be(200)
    end
  end

  describe "GET /v1/riders/1" do
    it "returns http success" do
      get "/v1/riders/1"
      expect(last_response.status).to be(200)
    end
  end

  describe "GET /v1/riders/1/request_ride" do
    it "returns http success" do
      get "v1/riders/4/request_ride"
      expect(last_response.status).to be(200)
    end
  end

  describe "GET /v1/drivers/1/finish_ride" do
    it "returns http success" do
      get "/v1/drivers/2/finish_ride"
      expect(last_response.status).to be(200)
    end
  end
end
