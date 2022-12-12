class Driver < ActiveRecord::Base
  has_many :rides

  validates :first_name, :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  extend Geocoder::Model::ActiveRecord
  def self.drivers
    Driver.all.to_json
  end

  def finish_ride(id)
    ride = Ride.where(driver_id: self.id, status: 'IN_PROGRESS').first
    if !ride.nil?
      ride.final_latitude = current_latitude
      ride.final_longitude = current_longitude
      ride.distance_km = ride.calculate_distance
      ride.calculate_total_amount
      ride.update(status: 'FINISHED')
      ride.save
      update(status: 'ACTIVE')
      create_transaction(ride)
      save

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

  def create_transaction(ride)
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
