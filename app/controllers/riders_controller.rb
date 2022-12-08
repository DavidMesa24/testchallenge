class RidersController < Sinatra::Base
  extend Geocoder::Model::ActiveRecord

  def self.index
    riders = Rider.all
    riders
  end

  def self.show(id)
    riders= Rider.find(id)
    riders
  end

  def self.token_card(id)
    rider = Rider.find(id)
    response = HTTParty.post('https://sandbox.wompi.co/v1/tokens/cards',
                             body: {
                               "number": '4242424242424242',
                               "cvc": '789',
                               "exp_month": '12',
                               "exp_year": '29',
                               "card_holder": 'Pedro Pérez'
                             }.to_json,
                             headers: { 'Authorization' => 'Bearer pub_test_vRiYJPMwTtNYXScYZKyTF75jrSQS65A4' }
    )
    rider.update(token: response['data']['id'])
    rider
  end

  def self.payment_source(id)
    rider = Rider.find(id)
    # Acceptance token first

    r_acceptance_token = HTTParty.get('https://sandbox.wompi.co/v1/merchants/pub_test_vRiYJPMwTtNYXScYZKyTF75jrSQS65A4')
    rider.acceptance_token = r_acceptance_token.parsed_response['data']['presigned_acceptance']['acceptance_token']

    # Payment source
    response = HTTParty.post('https://sandbox.wompi.co/v1/payment_sources',
                             :body => {
                               "type": 'CARD',
                               "token": rider.token,
                               "customer_email": rider.email,
                               "acceptance_token": rider.acceptance_token
                             }.to_json,
                             :headers => { 'Authorization' => 'Bearer prv_test_DbbddTKp7a8oH909sRs0NWH6eYDQ9Gix
      ' }
    )

    p response
    payment_source = PaymentSource.create(
      payment_source_id: response.parsed_response['data']['id'],
      method: 'CARD'
    )
    rider.payment_source_id = payment_source.id
    rider.save
    rider
  end

  def self.request_ride(id)

    rider = Rider.find(id)
    if rider.payment_source_id.nil?
      error = {
        "error": {
          "type": 'NOT_FOUND',
          "reason": 'No payment source, add a payment source first'
        }
      }
      error
    else
      driver = Driver.where(status: 'ACTIVE').first
      if !driver.nil?
        ride = Ride.create(
          driver_id: driver.id,
          rider_id: rider.id,
          current_latitude: rider.current_latitude,
          current_longitude: rider.current_longitude,
          created_at: Time.now,
          base_fee: 3500,
          status: 'IN_PROGRESS'
        )
        driver.update(status: 'BUSY')
        driver.save
        ride
      else
        error = {
          "error": {
            "type": 'NOT_FOUND',
            "reason": 'No drivers available'
          }
        }
        error
      end
    end
  end
end
