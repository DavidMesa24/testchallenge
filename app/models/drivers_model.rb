class Driver < ActiveRecord::Base
  has_many :rides

  extend Geocoder::Model::ActiveRecord
  def self.drivers
    Driver.all.to_json
  end
end