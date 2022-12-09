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
end