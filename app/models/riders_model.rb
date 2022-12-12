class Rider < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord
  has_many :rides
  has_one :payment_source

  validates :first_name, :email, :status, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }


  def self.riders
    Rider.all.to_json
  end

  def token_card(id)
    response = HTTParty.post('https://sandbox.wompi.co/v1/tokens/cards',
                             body: {
                               "number": '4242424242424242',
                               "cvc": '789',
                               "exp_month": '12',
                               "exp_year": '29',
                               "card_holder": 'Pedro Pérez'
                             }.to_json,
                             headers: { 'Authorization' => 'Bearer pub_test_vRiYJPMwTtNYXScYZKyTF75jrSQS65A4' })
    update(token: response['data']['id'])
    self
  end

  def payment_source(id)
    # Acceptance token first

    r_acceptance_token = HTTParty.get('https://sandbox.wompi.co/v1/merchants/pub_test_vRiYJPMwTtNYXScYZKyTF75jrSQS65A4')
    self.acceptance_token = r_acceptance_token.parsed_response['data']['presigned_acceptance']['acceptance_token']

    # Payment source
    response = HTTParty.post('https://sandbox.wompi.co/v1/payment_sources',
                             body: {
                               "type": 'CARD',
                               "token": token,
                               "customer_email": email,
                               "acceptance_token": acceptance_token
                             }.to_json,
                             headers: { 'Authorization' => 'Bearer prv_test_DbbddTKp7a8oH909sRs0NWH6eYDQ9Gix
      ' })

    payment_source = PaymentSource.create(
      payment_source_id: response.parsed_response['data']['id'],
      method: 'CARD'
    )
    self.payment_source_id = payment_source.id
    save
    self
  end

  def request_ride(id)
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
          current_latitude: rider.current_latitude.to_i,
          current_longitude: rider.current_longitude.to_i,
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
