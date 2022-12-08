class Ride < ActiveRecord::Base
  belongs_to :driver
  belongs_to :rider

  validates :current_latitude, :current_longitude, presence: true

  def calculate_distance
    d = Geocoder::Calculations.distance_between([current_latitude,current_longitude],
                                                [final_latitude,final_longitude], :units => :km)
    d
  end

  def calculate_total_amount
    self.duration = (self.updated_at - self.created_at)/60
    price_distance = 1000 * self.distance_km
    price_duration = 200 * self.duration
    base_fee = self.base_fee

    self.charge = base_fee + price_distance + price_duration
    self.save
  end

end