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

  def self.token_card(id)
    driver = Driver.find(id)
    response = HTTParty.post('https://sandbox.wompi.co/v1/tokens/cards',
                             body: {
                               "number": '4242424242424242',
                               "cvc": '789',
                               "exp_month": '12',
                               "exp_year": '29',
                               "card_holder": 'Pedro Pérez'
                             }.to_json,
                             headers: { 'Authorization' => 'Bearer pub_test_vRiYJPMwTtNYXScYZKyTF75jrSQS65A4' })
    driver.update(token: response['data']['id'])
    driver
  end

  def self.finish_ride(id)
    driver = Driver.find(id)
    ride = Ride.where(driver_id: driver.id, status: 'IN_PROGRESS').first
    if !ride.nil?
      ride.final_latitude = driver.current_latitude
      ride.final_longitude = driver.current_longitude
      ride.distance_km = ride.calculate_distance
      ride.calculate_total_amount
      ride.update(status: 'FINISHED')
      ride.save
      driver.update(status: 'ACTIVE')
      create_transaction(ride)
      driver.save

      ride
    else
      error = {
        "error": {
          "type":"NOT_FOUND",
          "reason":"No ride in progress"
        }
      }
      error
  end
  end

  def self.create_transaction(ride)
    reference = SecureRandom.hex(20)
    rider = Rider.find(ride.rider_id)
    p ride.charge.to_int
    response = HTTParty.post('https://sandbox.wompi.co/v1/transactions',
                             body: {
                               "amount_in_cents": ride.charge.to_int * 100,
                               "currency": "COP",
                               "customer_email": rider.email,
                               "payment_method": {
                                 "installments": 1
                               },
                               "reference": reference,
                               "payment_source_id": PaymentSource.find(rider.payment_source_id).payment_source_id
                             }.to_json,
                             headers: { 'Authorization' => 'Bearer prv_test_DbbddTKp7a8oH909sRs0NWH6eYDQ9Gix' })
    p response
    tr = Transaction.create(
      ride_id: ride.id,
      driver_id: ride.driver_id,
      rider_id: ride.rider_id,
      amount: ride.charge,
      status: response['data']['status']
    )
    ride.paid_out = true
    ride.save
  end
  end
