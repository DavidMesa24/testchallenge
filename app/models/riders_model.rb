class Rider < ActiveRecord::Base
extend Geocoder::Model::ActiveRecord
  has_many :rides
  has_one :payment_source

def self.riders
  Rider.all.to_json
end
end