class Driver < ActiveRecord::Base
  has_many :rides

  validates :first_name, :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  extend Geocoder::Model::ActiveRecord
  def self.drivers
    Driver.all.to_json
  end
end